import decimal
import logging
from django.db import transaction
from django.utils import timezone
from django.conf import settings
from django.shortcuts import get_object_or_404
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
        Atomically generates and increments the next transaction number 
        from the SerialNo model.
        """
        with transaction.atomic():
            serial = SerialNo.objects.select_for_update().get(
                table_name='tbl_online_sales', 
                is_active=True
            )
            prefix = serial.prefix_no or ""
            suffix = serial.suffix_no or ""
            next_val = serial.next_no
            sequence_val = serial.sequence_no
            
            # Format: {prefix}{year}{padded_sequence}{suffix}
            # e.g., SO20260001
            sequence_str = str(sequence_val).zfill(4)
            trans_no = f"{prefix}{next_val}{sequence_str}{suffix}"
            
            # Update sequence for next run
            serial.sequence_no += 1
            serial.save()
            
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
        """
        if not hasattr(user, 'online_customer') or not user.online_customer:
            raise ValueError("Customer profile not found for this user.")

        customer = user.online_customer
        addr = get_object_or_404(CustomerAddress, id=address_id, customer=customer)
        
        cart_items = Cart.objects.filter(user=user).select_related('product')
        if not cart_items.exists():
            raise ValueError("Cart is empty.")

        promo_per = session_data.get('promo_per', 0)
        promo_code = session_data.get('promo_code', None)

        totals = cls.calculate_order_totals(cart_items, promo_per)

        # Minimum Order Guard
        if totals['grand_total'] < settings.MIN_ORDER_AMOUNT:
            diff = settings.MIN_ORDER_AMOUNT - totals['grand_total']
            raise ValueError(f"Minimum order threshold not met. Short by ₹{diff}.")

        try:
            with transaction.atomic():
                trans_no = cls.generate_next_trans_no()
                
                # Create Sale Record
                order = OnlineSales.objects.create(
                    customer=customer,
                    customer_address=addr,
                    trans_no=trans_no,
                    trans_dt=timezone.now(),
                    status='Pending',
                    promo_per=promo_per,
                    promo_code=promo_code,
                    discount=totals['promo_discount'],
                    total_amt=totals['total_price'],
                    round_amt=totals['round_off'],
                    grand_amt=totals['grand_total'],
                    is_active=True,
                    created_by=user
                )
                
                # Create Line Items
                items_to_create = [
                    OnlineSalesItem(
                        online_sales=order,
                        product=item.product,
                        item_name=item.product.name,
                        item_code=item.product.code,
                        rate=item.product.price,
                        mrp=item.product.original_price or item.product.price,
                        qty=item.quantity,
                        item_total=item.product.price * item.quantity,
                        is_active=True,
                        created_by=user
                    ) for item in cart_items
                ]
                OnlineSalesItem.objects.bulk_create(items_to_create)
                
                # Cleanup Cart
                cart_items.delete()
                
                logger.info(f"Order {trans_no} successfully placed for user {user.username}")
                
                # Success Logic Handheld by caller (Email trigger, session cleanup)
                return order

        except Exception as e:
            logger.error(f"Critical error during order processing for user {user.username}: {str(e)}")
            send_order_error_emails_task.delay(user.id, str(e))
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
