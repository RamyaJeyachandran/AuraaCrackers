from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import TemplateView, ListView
from .models import Category, Product, Cart, Coupon, Customer, CustomerAddress, OnlineSales, OnlineSalesItem, Country, State, City, SerialNo
from django.db.models import Q, Sum, F
from django.http import JsonResponse
from django.views import View
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db import transaction
from django.core.mail import send_mail
from django.conf import settings
from django.utils import timezone
from django.contrib.auth import get_user_model
import decimal
from .tasks import send_order_success_emails_task, send_order_error_emails_task

User = get_user_model()

class HomeView(TemplateView):
    template_name = 'crackers/home.html'

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.role and request.user.role.name in ['Admin', 'Super Admin']:
            return redirect('/admin/dashboard/')
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['categories'] = Category.objects.filter(is_active=True).order_by('order')[:6]
        return context

class ProductListView(ListView):
    model = Product
    template_name = 'crackers/products.html'
    context_object_name = 'products'
    paginate_by = 40

    def get_queryset(self):
        queryset = super().get_queryset().filter(is_active=True).select_related('category')
        # ... existing filters ...
        category_name = self.request.GET.get('category')
        query = self.request.GET.get('q')
        sort = self.request.GET.get('sort', 'featured')

        if category_name and category_name != 'All':
            queryset = queryset.filter(category__name=category_name)
        
        if query:
            queryset = queryset.filter(
                Q(name__icontains=query) | 
                Q(code__icontains=query) | 
                Q(description__icontains=query)
            )

        if sort == 'price-low':
            queryset = queryset.order_by('category__order', 'category__name', 'sort_no', 'price')
        elif sort == 'price-high':
            queryset = queryset.order_by('category__order', 'category__name', 'sort_no', '-price')
        elif sort == 'name':
            queryset = queryset.order_by('category__order', 'category__name', 'sort_no', 'name')
        else:
            # Default ordering to support grouping by category
            queryset = queryset.order_by('category__order', 'category__name', 'sort_no', 'name')
        
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['categories'] = Category.objects.filter(is_active=True).order_by('order')
        context['selected_category'] = self.request.GET.get('category', 'All')
        context['search_query'] = self.request.GET.get('q', '')
        context['sort_by'] = self.request.GET.get('sort', 'featured')
        return context

class AboutView(TemplateView):
    template_name = 'crackers/about.html'

class SafetyView(TemplateView):
    template_name = 'crackers/safety.html'

class ContactView(TemplateView):
    template_name = 'crackers/contact.html'

class TermsView(TemplateView):
    template_name = 'crackers/terms.html'

class VisionView(TemplateView):
    template_name = 'crackers/vision.html'

class MissionView(TemplateView):
    template_name = 'crackers/mission.html'

class FounderStoryView(TemplateView):
    template_name = 'crackers/founder_story.html'

class CoreValuesView(TemplateView):
    template_name = 'crackers/core_values.html'

class WhyChooseView(TemplateView):
    template_name = 'crackers/why_choose.html'

class BrandPhilosophyView(TemplateView):
    template_name = 'crackers/brand_philosophy.html'

class AuraaPromiseView(TemplateView):
    template_name = 'crackers/auraa_promise.html'

class AuraaManifestoView(TemplateView):
    template_name = 'crackers/auraa_manifesto.html'

@method_decorator(csrf_exempt, name='dispatch')
class CartAddAPIView(View):
    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            return JsonResponse({'status': 'error', 'message': 'Authentication required'}, status=401)
        
        product_id = request.POST.get('product_id')
        quantity = int(request.POST.get('quantity', 1))
        
        try:
            product = Product.objects.get(id=product_id, is_active=True, is_disabled=0)
            cart_item, created = Cart.objects.get_or_create(
                user=request.user, 
                product=product,
                defaults={'quantity': quantity}
            )
            if not created:
                cart_item.quantity = quantity
                cart_item.save()
            
            cart_count = Cart.objects.filter(user=request.user).count()
            return JsonResponse({
                'status': 'success', 
                'message': 'Product added to cart successfully',
                'cart_count': cart_count,
                'data': {'product_id': product_id, 'quantity': quantity}
            })
        except Product.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': f'Product {product_id} not found or inactive'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

@method_decorator(csrf_exempt, name='dispatch')
class CartRemoveAPIView(View):
    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            return JsonResponse({'status': 'error', 'message': 'Authentication required'}, status=401)
            
        product_id = request.POST.get('product_id')
        Cart.objects.filter(user=request.user, product_id=product_id).delete()
        
        cart_count = Cart.objects.filter(user=request.user).count()
        return JsonResponse({
            'status': 'success', 
            'message': 'Product removed from cart',
            'cart_count': cart_count
        })

@method_decorator(csrf_exempt, name='dispatch')
class CartListAPIView(View):
    def get(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            return JsonResponse({'status': 'error', 'message': 'Authentication required'}, status=401)
            
        items = Cart.objects.filter(user=request.user).select_related('product')
        data = [{
            'id': item.id,
            'product_id': item.product.id,
            'name': item.product.name,
            'price': float(item.product.price),
            'original_price': float(item.product.original_price or item.product.price),
            'quantity': item.quantity,
            'total': float(item.product.price * item.quantity),
            'image': item.product.image
        } for item in items]
        
        promo_code = request.session.get('promo_code', None)
        promo_per = request.session.get('promo_per', 0)
        
        return JsonResponse({
            'status': 'success', 
            'items': data,
            'promo_code': promo_code,
            'promo_per': promo_per
        })

class CouponVerifyAPIView(View):
    def post(self, request):
        code = request.POST.get('code')
        coupon = Coupon.objects.filter(code=code, is_active=True, website_id=settings.WEBSITE_ID).first()
        if coupon:
            request.session['promo_code'] = code
            request.session['promo_per'] = float(coupon.percentage)
            return JsonResponse({
                'status': 'success',
                'discount_per': float(coupon.percentage),
                'promo_code': code
            })
        return JsonResponse({'status': 'error', 'message': 'Invalid promotion code.'}, status=400)

class OrderProcessingView(LoginRequiredMixin, TemplateView):
    template_name = 'crackers/order_processing.html'

    def dispatch(self, request, *args, **kwargs):
        user = request.user
        if not user.is_authenticated:
            return super().dispatch(request, *args, **kwargs)
        
        # Check if customer profile exists
        if not hasattr(user, 'online_customer') or not user.online_customer:
            return redirect('home')

        # Check cart status
        cart_items = Cart.objects.filter(user=user).select_related('product')
        if not cart_items.exists():
            return redirect('product_list')

        # Amount check - prevent direct URL access to checkout if min order not met
        total_price = sum(item.product.price * item.quantity for item in cart_items)
        promo_per = self.request.session.get('promo_per', 0)
        promo_discount = total_price * (decimal.Decimal(promo_per) / 100)
        sub_total = total_price - promo_discount
        packing_charges = sub_total * decimal.Decimal('0.03')
        grand_total_unrounded = sub_total + packing_charges
        grand_total = grand_total_unrounded.quantize(decimal.Decimal('1'), rounding=decimal.ROUND_HALF_UP)
        
        if grand_total < settings.MIN_ORDER_AMOUNT:
            return redirect('product_list')

        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user
        cart_items = Cart.objects.filter(user=user).select_related('product')
        
        # Calculate totals
        total_net = sum(item.product.original_price * item.quantity if item.product.original_price else item.product.price * item.quantity for item in cart_items)
        total_price = sum(item.product.price * item.quantity for item in cart_items)
        total_discount = total_net - total_price
        
        # Apply promo if in session
        promo_per = self.request.session.get('promo_per', 0)
        promo_discount = total_price * (decimal.Decimal(promo_per) / 100)
        
        sub_total = total_price - promo_discount
        packing_charges = sub_total * decimal.Decimal('0.03')
        grand_total_unrounded = sub_total + packing_charges
        grand_total = grand_total_unrounded.quantize(decimal.Decimal('1'), rounding=decimal.ROUND_HALF_UP)
        round_off = grand_total - grand_total_unrounded
        
        context['cart_items'] = cart_items
        context['total_net'] = total_net
        context['total_discount'] = total_discount
        context['promo_per'] = promo_per
        context['promo_code'] = self.request.session.get('promo_code', '')
        context['promo_discount'] = promo_discount
        context['initial_subtotal'] = total_price
        context['sub_total'] = sub_total
        context['packing_charges'] = packing_charges
        context['round_off'] = round_off
        context['grand_total'] = grand_total
        
        # Fetch addresses
        if hasattr(user, 'online_customer') and user.online_customer:
            context['addresses'] = CustomerAddress.objects.filter(customer=user.online_customer, is_active=True)
            context['customer'] = user.online_customer
        else:
            context['addresses'] = []
            
        return context

class AddressAddAPIView(LoginRequiredMixin, View):
    def post(self, request):
        user = request.user
        if not user.online_customer:
            return JsonResponse({'status': 'error', 'message': 'Customer profile not found.'}, status=400)
            
        address1 = request.POST.get('address1')
        zip_code = request.POST.get('zip')
        phone = request.POST.get('phone')
        
        if not address1 or not zip_code or not phone:
            return JsonResponse({'status': 'error', 'message': 'Address, Zip and Phone are required.'}, status=400)
            
        addr = CustomerAddress.objects.create(
            customer=user.online_customer,
            address1=address1,
            pincode=zip_code,
            phone=phone,
            is_shipping_default=False,
            is_active=True
        )
        return JsonResponse({'status': 'success', 'message': 'Address added successfully.', 'id': addr.id})

class PlaceOrderAPIView(LoginRequiredMixin, View):
    def post(self, request):
        user = request.user
        if not user.online_customer:
            return JsonResponse({'status': 'error', 'message': 'Customer profile not found.'}, status=400)
            
        addr_id = request.POST.get('address_id')
        addr = get_object_or_404(CustomerAddress, id=addr_id, customer=user.online_customer)
        
        cart_items = Cart.objects.filter(user=user).select_related('product')
        if not cart_items.exists():
            return JsonResponse({'status': 'error', 'message': 'Cart is empty.'}, status=400)

        # Min Order Check
        total_price = sum(item.product.price * item.quantity for item in cart_items)
        promo_per = request.session.get('promo_per', 0)
        promo_discount = total_price * (decimal.Decimal(promo_per) / 100)
        sub_total = total_price - promo_discount
        packing_charges = sub_total * decimal.Decimal('0.03')
        grand_total_unrounded = sub_total + packing_charges
        grand_total = grand_total_unrounded.quantize(decimal.Decimal('1'), rounding=decimal.ROUND_HALF_UP)
        round_off = grand_total - grand_total_unrounded
        
        if grand_total < settings.MIN_ORDER_AMOUNT:
            diff = settings.MIN_ORDER_AMOUNT - grand_total
            return JsonResponse({
                'status': 'error', 
                'message': f'Minimum order amount is ₹{settings.MIN_ORDER_AMOUNT}. You need ₹{diff} more.',
                'min_order': settings.MIN_ORDER_AMOUNT,
                'diff': float(diff)
            }, status=400)

        try:
            with transaction.atomic():
                # Get Next Serial Number (from tbl_serialNo)
                serial = SerialNo.objects.select_for_update().get(table_name='tbl_online_sales', is_active=True)
                prefix = serial.prefix_no or ""
                suffix = serial.suffix_no or ""
                next_val = serial.next_no
                
                # Format sequence_no as 0001, 0002, 0003...
                sequence_val = serial.sequence_no
                sequence_str = str(sequence_val).zfill(4)
                
                # Formula: prefixNo + NextNo + sequenceNo + suffixNo (Example: SO + 2026 + 0001 = SO20260001)
                trans_no = f"{prefix}{next_val}{sequence_str}{suffix}"
                
                # Update sequence_no for next order
                serial.sequence_no += 1
                serial.save()
                
                promo_per = request.session.get('promo_per', 0)
                promo_code = request.session.get('promo_code', None)
                
                order = OnlineSales.objects.create(
                    customer=user.online_customer,
                    customer_address=addr,
                    trans_no=trans_no,
                    trans_dt=timezone.now(),
                    status='Pending',
                    promo_per=promo_per,
                    promo_code=promo_code,
                    discount=promo_discount,
                    total_amt=total_price,
                    round_amt=round_off,
                    grand_amt=grand_total,
                    is_active=True,
                    created_by=user
                )
                
                order_items = [
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
                OnlineSalesItem.objects.bulk_create(order_items)
                
                # Clear Cart
                cart_items.delete()
                # Clear Session Promo
                if 'promo_per' in request.session:
                    del request.session['promo_per']
                if 'promo_code' in request.session:
                    del request.session['promo_code']

            # Success Email (Asynchronous)
            send_order_success_emails_task.delay(user.id, order.id)
            
            return JsonResponse({'status': 'success', 'message': 'Our support team will contact you shortly.'})

        except Exception as e:
            # Error Email (Asynchronous)
            send_order_error_emails_task.delay(user.id, str(e))
            return JsonResponse({'status': 'error', 'message': 'Failed to place order. Please try again later.'}, status=500)


class OrderHistoryListView(LoginRequiredMixin, ListView):
    model = OnlineSales
    template_name = 'crackers/order_history.html'
    context_object_name = 'orders'

    def get_queryset(self):
        user = self.request.user
        if not hasattr(user, 'online_customer') or not user.online_customer:
            return OnlineSales.objects.none()
        return OnlineSales.objects.filter(customer=user.online_customer, is_active=True).order_by('-trans_dt').select_related('customer')

class OrderDetailView(LoginRequiredMixin, TemplateView):
    template_name = 'crackers/order_detail.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        trans_no = self.kwargs.get('trans_no')
        user = self.request.user
        order = get_object_or_404(OnlineSales, trans_no=trans_no, customer=user.online_customer)
        context['order'] = order
        context['items'] = order.items.all().select_related('product')
        
        # Stepper logic
        stages = ['New', 'Progressing', 'Shipped', 'Delivered']
        current_idx = stages.index(order.status) if order.status in stages else 0
        context['stages'] = stages
        context['current_idx'] = current_idx
        context['progress_per'] = current_idx * 33.33
        return context

class OrderStatusListView(LoginRequiredMixin, ListView):
    model = OnlineSales
    template_name = 'crackers/order_status_list.html'
    context_object_name = 'orders'

    def get_queryset(self):
        # incomplete/non-completed orders (not Delivered and not Cancelled)
        return OnlineSales.objects.filter(
            customer=self.request.user.online_customer, 
            is_active=True
        ).exclude(status__in=['Delivered', 'Cancelled']).select_related('customer').prefetch_related('items__product').order_by('-trans_dt')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Add stepper data for each order
        orders = context['orders']
        stages = ['New', 'Progressing', 'Shipped', 'Delivered']
        for o in orders:
            o.current_idx = stages.index(o.status) if o.status in stages else 0
        context['stages'] = stages
        return context

class OrderDeleteAPIView(LoginRequiredMixin, View):
    def post(self, request, trans_no):
        order = get_object_or_404(OnlineSales, trans_no=trans_no, customer=request.user.online_customer)
        
        # Logic: Edit/Delete only if status is New/Progressing and not paid status completed
        if order.status not in ['New', 'Progressing'] or order.payment_status in ['Paid', 'Completed']:
            return JsonResponse({'status': 'error', 'message': 'This order is locked and cannot be deleted.'}, status=403)
            
        order.is_active = False # Safe delete
        order.save()
        return JsonResponse({'status': 'success', 'message': 'Order deleted successfully.'})

class OrderEditView(LoginRequiredMixin, TemplateView):
    template_name = 'crackers/order_edit.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        trans_no = self.kwargs.get('trans_no')
        order = get_object_or_404(OnlineSales, trans_no=trans_no, customer=self.request.user.online_customer)
        
        if order.status not in ['New', 'Progressing'] or order.payment_status in ['Paid', 'Completed']:
            # Redirect back with error if not editable
            return context # Will handle in template via warning
            
        context['order'] = order
        context['items'] = order.items.all()
        return context

    def post(self, request, trans_no):
        order = get_object_or_404(OnlineSales, trans_no=trans_no, customer=request.user.online_customer)
        if order.status not in ['New', 'Progressing'] or order.payment_status in ['Paid', 'Completed']:
            return JsonResponse({'status': 'error', 'message': 'Order locked.'}, status=403)

        try:
            with transaction.atomic():
                total_amt = decimal.Decimal('0.00')
                for item in order.items.all():
                    qty_key = f"qty_{item.id}"
                    if qty_key in request.POST:
                        new_qty = decimal.Decimal(request.POST[qty_key])
                        if new_qty <= 0:
                            item.delete()
                        else:
                            item.qty = new_qty
                            item.item_total = item.rate * new_qty
                            item.save()
                            total_amt += item.item_total
                
                sub_total = total_amt - order.discount
                packing = sub_total * decimal.Decimal('0.03')
                grand_total_unrounded = sub_total + packing
                grand_total = grand_total_unrounded.quantize(decimal.Decimal('1'), rounding=decimal.ROUND_HALF_UP)
                round_off = grand_total - grand_total_unrounded

                order.total_amt = total_amt
                order.round_amt = round_off
                order.grand_amt = grand_total
                order.save()
                
            return JsonResponse({'status': 'success', 'message': 'Order updated successfully.'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class TestimonialsView(TemplateView):
    template_name = "crackers/testimonials.html"

class StateListAPIView(View):
    def get(self, request):
        country_id = request.GET.get('country_id')
        if not country_id:
            # Default to India ID = 1 as per requirement
            country_id = settings.COMPANY_ID # wait, COMPANY_ID is 1, let's assuming India ID is 1
            # Safer to find it
            india = Country.objects.filter(name='India').first()
            if india:
                country_id = india.id
            else:
                return JsonResponse({'status': 'error', 'message': 'Country not found'}, status=404)
        
        states = State.objects.filter(country_id=country_id, is_active=True).order_by('name')
        data = [{'id': s.id, 'name': s.name} for s in states]
        return JsonResponse({'status': 'success', 'states': data})

class CityListAPIView(View):
    def get(self, request):
        state_id = request.GET.get('state_id')
        if not state_id:
            return JsonResponse({'status': 'error', 'message': 'State ID is required'}, status=400)
        cities = City.objects.filter(state_id=state_id, is_active=True).order_by('name')
        data = [{'id': c.id, 'name': c.name} for c in cities]
        return JsonResponse({'status': 'success', 'cities': data})
