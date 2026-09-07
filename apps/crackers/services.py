import decimal
import logging
from django.db import connection, transaction
from django.utils import timezone
from django.conf import settings
from django.shortcuts import get_object_or_404
from django.db.models import Q
from .models import Cart, OnlineSales, OnlineSalesItem, SerialNo, CustomerAddress, Product
from .tasks import send_order_success_emails_task, send_order_error_emails_task

logger = logging.getLogger(__name__)

class OrderService:
    """
    Handles all business logic related to order processing, serial number management, 
    and transaction integrity.
    """

    @staticmethod
    def generate_next_trans_no():
        """
        Generates the next transaction number in YYYYMMNNNN format safely under high concurrency.
        Uses `SerialNo` table with atomic row-level locks (`select_for_update`) to prevent duplicate order numbers.
        """
        from django.utils import timezone
        now = timezone.now()
        period = now.strftime('%Y%m') # e.g., 202609
        year_prefix = now.strftime('%Y') # e.g., 2026
        
        with transaction.atomic():
            # Get or lock the SerialNo counter row for this period
            serial, created = SerialNo.objects.select_for_update().get_or_create(
                table_name='tbl_online_sales',
                prefix_no=period,
                defaults={'next_no': 1, 'sequence_no': 1}
            )
            
            if created or serial.next_no <= 1:
                # First time for this period or uninitialized: compute next number from existing orders in DB
                last_order = OnlineSales.objects.filter(
                    trans_no__startswith=year_prefix,
                    is_active=True
                ).order_by('-trans_no').first()
                
                if last_order and last_order.trans_no and len(last_order.trans_no) >= 4:
                    try:
                        last_seq = int(last_order.trans_no[-4:])
                        next_seq = last_seq + 1
                    except (ValueError, TypeError):
                        next_seq = 1
                else:
                    next_seq = 1
                
                serial.next_no = next_seq + 1
                seq_num = next_seq
            else:
                seq_num = serial.next_no
                serial.next_no += 1
            
            serial.sequence_no = seq_num
            serial.save()

            trans_no = f"{period}{str(seq_num).zfill(4)}"
            
            # Uniqueness check: skip any existing trans_no
            while OnlineSales.objects.filter(trans_no=trans_no).exists():
                seq_num = serial.next_no
                serial.next_no += 1
                serial.sequence_no = seq_num
                serial.save()
                trans_no = f"{period}{str(seq_num).zfill(4)}"

            return trans_no

    @classmethod
    def calculate_order_totals(cls, cart_items, promo_per=0):
        """
        Calculates all financial components of an order strictly following business rules.
        """
        total_price = sum(item.product.price * item.quantity for item in cart_items)
        promo_discount = total_price * (decimal.Decimal(promo_per) / 100)
        sub_total = total_price - promo_discount
        
        # Consistent 3% packing charge logic
        packing_charges = sub_total * decimal.Decimal('0.03')
        grand_total_unrounded = sub_total + packing_charges
        
        # Rounding to nearest integer
        grand_total = grand_total_unrounded.quantize(
            decimal.Decimal('1'), 
            rounding=decimal.ROUND_HALF_UP
        )
        round_off = grand_total - grand_total_unrounded
        
        return {
            'total_price': total_price,
            'promo_discount': promo_discount,
            'sub_total': sub_total,
            'packing_charges': packing_charges,
            'grand_total': grand_total,
            'round_off': round_off
        }

    @classmethod
    def process_order_checkout(cls, user, address_id, session_data):
        """
        Orchestrates the entire order pipeline: verification, creation, and cleanup.
        Supports both new order creation and existing order updates (Edit Mode).
        """
        if not hasattr(user, 'online_customer') or not user.online_customer:
            raise ValueError("Customer profile not found for this user.")

        customer = user.online_customer
        if not address_id:
            raise ValueError("Please select or add a shipping address.")
        try:
            addr = CustomerAddress.objects.get(id=address_id, customer=customer)
        except CustomerAddress.DoesNotExist:
            raise ValueError("Selected shipping address was not found.")
        
        cart_items = Cart.objects.filter(user=user).select_related('product')
        if not cart_items.exists():
            raise ValueError("Cart is empty.")

        # Check for disabled products in cart
        disabled_items = cart_items.filter(Q(product__is_active=False) | Q(product__is_disabled=1))
        if disabled_items.exists():
            item_names = ", ".join([item.product.name for item in disabled_items])
            raise ValueError(f"The following items in your cart are currently unavailable: {item_names}. Please remove them to proceed.")

        promo_per = session_data.get('promo_per', 0)
        promo_code = session_data.get('promo_code', None)
        editing_trans_no = session_data.get('editing_order_no')

        totals = cls.calculate_order_totals(cart_items, promo_per)

        # Minimum Order Guard
        user_phone = getattr(user, 'phone_number', '') or ''
        exempt_numbers = getattr(settings, 'MIN_ORDER_EXEMPT_MOBILE_NUMBERS', set())
        is_exempt = user_phone in exempt_numbers

        if not is_exempt and totals['grand_total'] < settings.MIN_ORDER_AMOUNT:
            diff = settings.MIN_ORDER_AMOUNT - totals['grand_total']
            raise ValueError(f"Minimum order threshold not met. Short by ₹{diff}.")

        try:
            with transaction.atomic():
                if editing_trans_no:
                    # UPDATE MODE
                    order = OnlineSales.objects.select_for_update().get(
                        trans_no=editing_trans_no, 
                        customer=customer
                    )
                    order.customer_address = addr
                    order.promo_per = promo_per
                    order.promo_code = promo_code
                    order.discount = totals['promo_discount']
                    order.total_amt = totals['total_price']
                    order.round_amt = totals['round_off']
                    order.grand_amt = totals['grand_total']
                    order.save()
                    
                    # Remove old items to replace with current cart state
                    order.items.all().delete()
                    trans_no = editing_trans_no
                else:
                    # NEW ORDER MODE
                    trans_no = cls.generate_next_trans_no()
                    sid = transaction.savepoint()
                    try:
                        order = OnlineSales.objects.create(
                            customer=customer,
                            customer_address=addr,
                            trans_no=trans_no,
                            trans_dt=timezone.now(),
                            status='Ordered',
                            promo_per=promo_per,
                            promo_code=promo_code,
                            discount=totals['promo_discount'],
                            total_amt=totals['total_price'],
                            round_amt=totals['round_off'],
                            grand_amt=totals['grand_total'],
                            is_active=True,
                            created_by=user
                        )
                        transaction.savepoint_commit(sid)
                    except Exception as err:
                        transaction.savepoint_rollback(sid)
                        if 'pkey' in str(err).lower() or 'duplicate key' in str(err).lower():
                            logger.warning("Primary key sequence out-of-sync for tbl_online_sales. Repairing sequence...")
                            with connection.cursor() as cursor:
                                cursor.execute("SELECT setval(pg_get_serial_sequence('tbl_online_sales', 'id'), COALESCE((SELECT MAX(id) FROM tbl_online_sales), 0) + 1, false);")
                            order = OnlineSales.objects.create(
                                customer=customer,
                                customer_address=addr,
                                trans_no=trans_no,
                                trans_dt=timezone.now(),
                                status='Ordered',
                                promo_per=promo_per,
                                promo_code=promo_code,
                                discount=totals['promo_discount'],
                                total_amt=totals['total_price'],
                                round_amt=totals['round_off'],
                                grand_amt=totals['grand_total'],
                                is_active=True,
                                created_by=user
                            )
                        else:
                            raise err
                
                # Create Line Items (Unified logic for both modes)
                items_to_create = [
                    OnlineSalesItem(
                        online_sales=order,
                        product=item.product,
                        item_name=item.product.name,
                        item_code=item.product.code,
                        rate=item.product.price,
                        mrp=item.product.original_price or item.product.purchase_rate or item.product.price,
                        qty=item.quantity,
                        item_total=item.product.price * item.quantity,
                        is_active=True,
                        created_by=user
                    ) for item in cart_items
                ]
                
                sid_item = transaction.savepoint()
                try:
                    OnlineSalesItem.objects.bulk_create(items_to_create)
                    transaction.savepoint_commit(sid_item)
                except Exception as err:
                    transaction.savepoint_rollback(sid_item)
                    if 'pkey' in str(err).lower() or 'duplicate key' in str(err).lower():
                        logger.warning("Primary key sequence out-of-sync for tbl_onlinesales_items. Repairing sequence...")
                        with connection.cursor() as cursor:
                            cursor.execute("SELECT setval(pg_get_serial_sequence('tbl_onlinesales_items', 'id'), COALESCE((SELECT MAX(id) FROM tbl_onlinesales_items), 0) + 1, false);")
                        OnlineSalesItem.objects.bulk_create(items_to_create)
                    else:
                        raise err
                
                # Cleanup Cart
                cart_items.delete()
                
                logger.info(f"Order {trans_no} successfully processed (Mode: {'Update' if editing_trans_no else 'New'})")
                
                return order

        except Exception as e:
            logger.error(f"Critical error during order processing for user {user.username}: {str(e)}")
            try:
                send_order_error_emails_task.delay(user.id, str(e))
            except Exception as celery_err:
                logger.warning(f"Could not send order error email task: {celery_err}")
            raise e

    @classmethod
    def recalculate_existing_order(cls, order):
        """
        Recalculates an existing order's totals based on its current line items.
        Useful for edits or status updates.
        """
        items = order.items.all()
        total_price = sum(item.rate * item.qty for item in items)
        
        # Consistent logic for packing and rounding
        promo_discount = total_price * (decimal.Decimal(order.promo_per) / 100)
        sub_total = total_price - promo_discount
        packing = sub_total * decimal.Decimal('0.03')
        grand_total_unrounded = sub_total + packing
        grand_total = grand_total_unrounded.quantize(decimal.Decimal('1'), rounding=decimal.ROUND_HALF_UP)
        round_off = grand_total - grand_total_unrounded

        order.total_amt = total_price
        order.discount = promo_discount
        order.round_amt = round_off
        order.grand_amt = grand_total
        order.save()
        return order
