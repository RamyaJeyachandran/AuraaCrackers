from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import TemplateView, ListView, DetailView
from .models import Category, Product, Cart, Coupon, Customer, CustomerAddress, OnlineSales, OnlineSalesItem, Country, State, City, SerialNo, Testimonial
from django.db.models import Q, Sum, F, Min, IntegerField, Value, CharField, Avg, DecimalField, Max
from django.db.models.functions import Length, Cast, Coalesce, LPad
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
import logging
from .tasks import send_order_success_emails_task, send_order_error_emails_task, trigger_n8n_order_webhook_task
from .services import OrderService
from django.utils.text import slugify

logger = logging.getLogger(__name__)
User = get_user_model()

class HomeView(TemplateView):
    template_name = 'crackers/home.html'

    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['categories'] = Category.objects.filter(is_active=True).order_by('order')[:6]
        
        # Add testimonials for the "What They Say" section
        testimonials = list(Testimonial.objects.filter(is_active=True).order_by('-created_at'))
        context['testimonials'] = testimonials
        context['avg_rating'] = Testimonial.objects.filter(is_active=True).aggregate(Avg('rating'))['rating__avg'] or 0
        context['reviews_count'] = len(testimonials)
        
        return context

class ProductListView(ListView):
    model = Product
    template_name = 'crackers/products.html'
    context_object_name = 'products'


    def get_queryset(self):
        queryset = super().get_queryset().filter(is_active=True, category__is_active=True).select_related('category')
        
        # Filter: AND COALESCE("itemCode", '') <> ''
        queryset = queryset.filter(code__isnull=False).exclude(code='')

        # Annotation: LPAD("itemCode", 10, '0') for numerical sorting
        queryset = queryset.annotate(
            padded_code=LPad('code', 10, Value('0'))
        )

        category_name = self.request.GET.get('category')
        query = self.request.GET.get('q')
        sort = self.request.GET.get('sort', 'featured')

        # Note: Category filtering removed as per user request to show all categories 
        # and simply scroll to the selected one.
        # Note: Category filtering removed as per user request to show all categories 
        # and simply scroll to the selected one.
        # if category_name and category_name != 'All':
        #     queryset = queryset.filter(category__name=category_name)
        
        if query:
            queryset = queryset.filter(
                Q(name__icontains=query) | 
                Q(code__icontains=query) | 
                Q(description__icontains=query)
            )

        if sort == 'price-low':
            queryset = queryset.order_by('price', 'padded_code')
        elif sort == 'price-high':
            queryset = queryset.order_by('-price', 'padded_code')
        elif sort == 'name-asc':
            queryset = queryset.order_by('name', 'padded_code')
        elif sort == 'name-desc':
            queryset = queryset.order_by('-name', 'padded_code')
        elif sort == 'most-ordered':
            queryset = queryset.annotate(
                order_count=Coalesce(Sum('onlinesalesitem__qty'), 0, output_field=DecimalField())
            ).order_by('-order_count', 'padded_code')
        else:
            # Default ordering: By category order, then by the LPAD result
            queryset = queryset.order_by('category__order', 'padded_code')

        # Optimization: only fetch fields needed for the template to reduce memory and DB load
        queryset = queryset.only(
            'id', 'name', 'code', 'image', 'price', 'purchase_rate', 
            'is_disabled', 'is_active',
            'category__id', 'category__name', 'category__order',
            'unit__name', 'unit__description'
        )
        
        # If it's an AJAX request (using HX-Request or a custom header), return the partial
        if self.request.headers.get('x-requested-with') == 'XMLHttpRequest' or self.request.GET.get('ajax') == '1':
            self.template_name = 'crackers/partials/product_table_partial.html'
            
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['categories'] = Category.objects.filter(is_active=True).order_by('order')
        context['selected_category'] = self.request.GET.get('category', 'All')
        context['search_query'] = self.request.GET.get('q', '')
        context['sort_by'] = self.request.GET.get('sort', 'featured')

        # Add a dynamic key segment for cache invalidation
        last_prod_update = Product.objects.aggregate(Max('updated_at'))['updated_at__max']
        last_cat_update = Category.objects.aggregate(Max('updated_at'))['updated_at__max']
        context['cache_version'] = f"{last_prod_update.timestamp() if last_prod_update else 0}-{last_cat_update.timestamp() if last_cat_update else 0}"

        return context

class ProductSearchAPIView(View):
    def get(self, request):
        query = request.GET.get('q', '').strip()
        if len(query) < 3:
            return JsonResponse({'status': 'success', 'results': []})
            
        products = Product.objects.filter(is_active=True, category__is_active=True)
        products = products.filter(
            Q(name__icontains=query) | 
            Q(code__icontains=query) | 
            Q(description__icontains=query)
        ).select_related('category')[:15]
        
        results = []
        for p in products:
            results.append({
                'id': p.id,
                'name': p.name,
                'code': p.code,
                'price': float(p.price),
                'category_id': p.category_id,
                'category_name': p.category.name,
                'category_slug': slugify(p.category.name)
            })
            
        return JsonResponse({'status': 'success', 'results': results})

class AboutView(TemplateView):
    template_name = 'crackers/about.html'

class SafetyView(TemplateView):
    template_name = 'crackers/safety.html'

class ContactView(TemplateView):
    template_name = 'crackers/contact.html'

class TermsView(TemplateView):
    template_name = 'crackers/terms.html'

class PrivacyView(TemplateView):
    template_name = 'crackers/privacy.html'

class ComplianceView(TemplateView):
    template_name = 'crackers/compliance.html'

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
            'original_price': float(item.product.original_price or item.product.purchase_rate or item.product.price),
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
            if user.role and user.role.name in ['Admin', 'Super Admin']:
                # Auto-create customer profile for Admin so they can place orders
                from django.db import transaction
                try:
                    with transaction.atomic():
                        customer = Customer.objects.create(
                            name=user.full_name,
                            contact_person=user.full_name,
                            contact_person_no=user.phone_number,
                            is_online=True,
                            is_active=True,
                            created_by_id=settings.ADMIN_USER_ID
                        )
                        user.online_customer = customer
                        user.save()
                except:
                    return redirect('home')
            else:
                return redirect('home')

        # Check cart status
        cart_items = Cart.objects.filter(user=user).select_related('product')
        if not cart_items.exists():
            return redirect('product_list')

        # Amount check - prevent direct URL access to checkout if min order not met
        promo_per = self.request.session.get('promo_per', 0)
        totals = OrderService.calculate_order_totals(cart_items, promo_per)
        
        if totals['grand_total'] < settings.MIN_ORDER_AMOUNT:
            return redirect('product_list')

        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user
        cart_items = Cart.objects.filter(user=user).select_related('product')
        
        # Calculate totals
        total_net = sum((item.product.original_price or item.product.purchase_rate or item.product.price) * item.quantity for item in cart_items)
        promo_per = self.request.session.get('promo_per', 0)
        totals = OrderService.calculate_order_totals(cart_items, promo_per)
        
        context['cart_items'] = cart_items
        context['total_net'] = total_net
        context['total_discount'] = total_net - totals['total_price']
        context['promo_per'] = promo_per
        context['promo_code'] = self.request.session.get('promo_code', '')
        context['promo_discount'] = totals['promo_discount']
        context['initial_subtotal'] = totals['total_price']
        context['sub_total'] = totals['sub_total']
        context['packing_charges'] = totals['packing_charges']
        context['round_off'] = totals['round_off']
        context['grand_total'] = totals['grand_total']
        
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

    # ---------------------------------------------------------------
    # TEMPORARY FLAG — set to False to re-enable order placement
    ORDER_PLACEMENT_DISABLED = False
    # ---------------------------------------------------------------

    def post(self, request):
        # Block order placement when the flag is active.
        # No database writes and no emails are triggered.
        if self.ORDER_PLACEMENT_DISABLED:
            return JsonResponse({
                'status': 'error',
                'title': 'Order Placement Temporarily Unavailable',
                'message': 'Order placement is temporarily unavailable. Please try again later.',
                'code': 'ORDER_PLACEMENT_UNAVAILABLE',
            }, status=503)

        user = request.user
        addr_id = request.POST.get('address_id')
        
        try:
            # Shift balance of logic to Service Layer
            order = OrderService.process_order_checkout(
                user=user,
                address_id=addr_id,
                session_data=request.session
            )
            
            # Post-processing (Session Cleanup + Email Task)
            editing_order = request.session.get('editing_order_no')
            for k in ['promo_per', 'promo_code', 'editing_order_no']:
                if k in request.session:
                    del request.session[k]

            try:
                send_order_success_emails_task.delay(user.id, order.id)
            except Exception as celery_err:
                logger.warning(f"Could not queue order email task: {celery_err}")

            msg = f'Order {order.trans_no} updated successfully.' if editing_order else f'Order {order.trans_no} placed successfully. Our support team will contact you shortly.'
            return JsonResponse({
                'status': 'success', 
                'message': msg
            })

        except ValueError as ve:
            # Handle user-friendly errors (Min order not met, cart empty, missing address, etc.)
            return JsonResponse({
                'status': 'error', 
                'message': str(ve)
            }, status=400)
            
        except Exception as e:
            logger.exception(f"Unhandled error during order placement for user {user.username}: {str(e)}")
            return JsonResponse({
                'status': 'error', 
                'message': f'Failed to place order: {str(e)}' if settings.DEBUG else 'Failed to place order. Our engineers have been notified.'
            }, status=500)


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
        stages = ['ORDERED', 'PACKED', 'DISPATCHED', 'IN TRANSIT', 'DELIVERED']
        # Map current status to one of the stages for highlight, including legacy support
        s_upper = order.status.upper()
        if s_upper in ['NEW', 'ORDERED']: current_idx = 0
        elif s_upper in ['PROGRESSING', 'PACKED']: current_idx = 1
        elif s_upper in ['SHIPPED', 'DISPATCHED', 'DISTACHED']: current_idx = 2
        elif s_upper in ['IN TRANSIT', 'INTRANSIT']: current_idx = 3
        elif s_upper in ['DELIVERED', 'DELIVERYED']: current_idx = 4
        else: current_idx = 0
        
        context['stages'] = stages
        context['current_idx'] = current_idx
        context['progress_per'] = current_idx * 25 # 4 intervals for 5 stages
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
        stages = ['ORDERED', 'PACKED', 'DISPATCHED', 'IN TRANSIT', 'DELIVERED']
        for o in orders:
            s_upper = o.status.upper()
            if s_upper in ['NEW', 'ORDERED']: o.current_idx = 0
            elif s_upper in ['PROGRESSING', 'PACKED']: o.current_idx = 1
            elif s_upper in ['SHIPPED', 'DISPATCHED', 'DISTACHED']: o.current_idx = 2
            elif s_upper in ['IN TRANSIT', 'INTRANSIT']: o.current_idx = 3
            elif s_upper in ['DELIVERED', 'DELIVERYED']: o.current_idx = 4
            else: o.current_idx = 0
        context['stages'] = stages
        return context

class OrderDeleteAPIView(LoginRequiredMixin, View):
    def post(self, request, trans_no):
        order = get_object_or_404(OnlineSales, trans_no=trans_no, customer=request.user.online_customer)
        
        # Logic: Edit/Delete only if status is New/Progressing/Ordered
        if order.status.lower() not in ['new', 'progressing', 'ordered', 'on hold', 'onhold']:
            return JsonResponse({'status': 'error', 'message': 'This order is locked and cannot be deleted.'}, status=403)
            
        order.is_active = False # Safe delete
        order.save()
        return JsonResponse({'status': 'success', 'message': 'Order deleted successfully.'})


# Obsolete OrderEditView logic removed


from django.core.cache import cache

class TestimonialsView(TemplateView):
    template_name = "crackers/testimonials.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        cache_key = 'testimonials_data_fragment'
        cached_data = cache.get(cache_key)
        
        if not cached_data:
            testimonials = list(Testimonial.objects.filter(is_active=True).order_by('-created_at'))
            avg_rating = Testimonial.objects.filter(is_active=True).aggregate(Avg('rating'))['rating__avg'] or 0
            cached_data = {
                'testimonials': testimonials,
                'avg_rating': avg_rating,
                'reviews_count': len(testimonials)
            }
            # Cache for 1 hour
            cache.set(cache_key, cached_data, 3600)
            
        context.update(cached_data)
        return context

class LoadOrderToCartView(LoginRequiredMixin, View):
    def get(self, request, trans_no):
        order = get_object_or_404(OnlineSales, trans_no=trans_no, customer=request.user.online_customer)
        
        # Guard: Check if editable (matching the buttons visibility)
        s_lower = order.status.lower()
        if s_lower not in ['new', 'ordered', 'on hold', 'onhold']:
            return redirect('order_history')
            
        # Clear current cart
        Cart.objects.filter(user=request.user).delete()
        
        # Populate cart from order items
        for item in order.items.all():
            Cart.objects.create(
                user=request.user,
                product=item.product,
                quantity=item.qty
            )
            
        # Set session for edit mode
        request.session['editing_order_no'] = trans_no
        
        return redirect('product_list')

class CancelOrderEditView(LoginRequiredMixin, View):
    def get(self, request):
        if 'editing_order_no' in request.session:
            del request.session['editing_order_no']
        
        # Clear cart on cancel edit to restore clean state
        Cart.objects.filter(user=request.user).delete()
        return redirect('product_list')

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

class OrderDownloadView(LoginRequiredMixin, DetailView):
    model = OnlineSales
    slug_field = 'trans_no'
    slug_url_kwarg = 'trans_no'
    
    def get_queryset(self):
        user = self.request.user
        if not hasattr(user, 'online_customer') or not user.online_customer:
            return OnlineSales.objects.none()
        return OnlineSales.objects.filter(customer=user.online_customer, is_active=True)

    def get(self, request, *args, **kwargs):
        from django.template.loader import get_template
        from xhtml2pdf import pisa
        from io import BytesIO
        from django.http import HttpResponse
        from django.db.models import Sum
        
        self.object = self.get_object()
        template = get_template('dashboard/order_estimate_pdf.html')
        
        items = self.object.items.all().select_related('product').order_by('item_code')
        for item in items:
            item.unit_rate = item.rate
            if item.qty > 0:
                item.unit_discount = item.discount_amt / item.qty
                item.final_rate = item.item_total / item.qty
            else:
                item.unit_discount = 0
                item.final_rate = 0

        context = {
            'order': self.object,
            'items': items,
            'total_qty': items.aggregate(Sum('qty'))['qty__sum'] or 0,
            'total_items': items.count(),
        }
        
        html = template.render(context)
        result = BytesIO()
        pdf = pisa.pisaDocument(BytesIO(html.encode("UTF-8")), result)
        
        if not pdf.err:
            response = HttpResponse(result.getvalue(), content_type='application/pdf')
            response['Content-Disposition'] = f'attachment; filename="Estimate_{self.object.trans_no}.pdf"'
            return response
        return HttpResponse('Error generating PDF', status=400)

import tempfile
import os
try:
    from faster_whisper import WhisperModel
except ImportError:
    WhisperModel = None

whisper_model = None

@method_decorator(csrf_exempt, name='dispatch')
class SpeechToTextAPIView(View):
    def post(self, request):
        global whisper_model
        
        audio_file = request.FILES.get('audio')
        if not audio_file:
            return JsonResponse({'status': 'error', 'message': 'No audio file provided'}, status=400)
            
        if WhisperModel is None:
            return JsonResponse({'status': 'error', 'message': 'faster-whisper is not installed'}, status=500)
            
        temp_audio_path = None
        try:
            if whisper_model is None:
                # Load the model
                whisper_model = WhisperModel("small", device="cpu", compute_type="int8")
                
            # Save the uploaded file to a temporary location
            with tempfile.NamedTemporaryFile(delete=False, suffix=".webm") as temp_audio:
                for chunk in audio_file.chunks():
                    temp_audio.write(chunk)
                temp_audio_path = temp_audio.name
                
            # Transcribe
            segments, info = whisper_model.transcribe(temp_audio_path, beam_size=5)
            
            # Check language
            detected_lang = info.language
            if detected_lang not in ['en', 'ta', 'hi']:
                os.unlink(temp_audio_path)
                return JsonResponse({
                    'status': 'error',
                    'message': 'Please speak in Tamil, Hindi, or English.',
                    'detected_language': detected_lang
                }, status=400)
                
            text = " ".join([segment.text for segment in segments]).strip()
            
            # Clean up
            os.unlink(temp_audio_path)
            
            return JsonResponse({
                'status': 'success',
                'text': text,
                'language': detected_lang
            })
            
        except Exception as e:
            if temp_audio_path and os.path.exists(temp_audio_path):
                os.unlink(temp_audio_path)
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)
