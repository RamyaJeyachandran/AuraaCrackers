from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate, logout
from django.views.generic import TemplateView, View
from django.http import JsonResponse
from django.db import IntegrityError, transaction
from .models import User, Role
from apps.crackers.models import Product, Category, Customer, CustomerAddress, Company, Branch, OnlineSales
from .services import AuthService
from django.db.models import Sum

from django.contrib.auth.mixins import LoginRequiredMixin
from django.conf import settings
import logging
logger = logging.getLogger(__name__)

from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator

class LoginView(TemplateView):
    template_name = 'users/login.html'

class ProfileView(LoginRequiredMixin, TemplateView):
    template_name = 'users/profile.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user
        if user.online_customer:
            # Get the default shipping address created during signup
            address = CustomerAddress.objects.filter(customer=user.online_customer, is_shipping_default=True).first()
            context['customer_address'] = address
        return context

class SignupAPIView(View):
    def post(self, request):
        try:
            # Shift balance of logic to AuthService
            user = AuthService.register_customer(data=request.POST)

            # Auto login the user
            user.backend = 'apps.users.backends.MobileBackend'
            login(request, user)
            
            # Redirection logic
            next_url = request.POST.get('next', '/')
            if not next_url or next_url == 'null': next_url = '/'
            
            # Note: Admins can now also access front-end, so we only redirect if no specific next_url is set
            if user.role and user.role.name in ['Admin', 'Super Admin'] and next_url == '/':
                next_url = '/admin/dashboard/'

            return JsonResponse({
                'status': 'success', 
                'message': f'Welcome, {user.full_name}! Registration successful.',
                'redirect': next_url
            })
        except Exception as e:
            logger.error(f"Signup exception: {str(e)}")
            return JsonResponse({
                'status': 'error', 
                'message': 'Registration failed. Our support team is available if this persists.'
            }, status=500)

class LoginAPIView(View):
    def post(self, request):
        try:
            mobile = request.POST.get('mobile', '').strip()
            password = request.POST.get('password', '').strip()
            
            logger.info(f"Login attempt for: {mobile}")

            if not mobile or not password:
                return JsonResponse({'status': 'error', 'message': 'Mobile No and Password are required.'}, status=400)

            # Let our custom MobileBackend find the user by either mobile OR username!
            user = authenticate(request, username=mobile, password=password)

            if user is not None:
                if user.is_active:
                    # Check if associated customer is active
                    if hasattr(user, 'online_customer') and user.online_customer and not user.online_customer.is_active:
                        return JsonResponse({'status': 'error', 'message': 'Your account has been deactivated. Please contact support.'}, status=403)

                    login(request, user)
                    # Success - determine role and redirect
                    display_name = user.full_name or user.username
                    
                    # Redirection logic
                    next_url = request.POST.get('next', '/')
                    if not next_url or next_url == 'null': next_url = '/'
                    
                    # Note: Admins can now also access front-end, so we only redirect if no specific next_url is set
                    if user.role and user.role.name in ['Admin', 'Super Admin'] and next_url == '/':
                        next_url = '/admin/dashboard/'
                    
                    return JsonResponse({
                        'status': 'success', 
                        'message': f'Welcome back, {display_name}!', 
                        'redirect': next_url
                    })
                else:
                    return JsonResponse({'status': 'error', 'message': 'Account is disabled.'}, status=403)
            else:
                return JsonResponse({'status': 'error', 'message': 'Invalid Mobile No or Password.'}, status=401)
        except Exception as e:
            logger.error(f"Login API exception: {str(e)}")
            return JsonResponse({
                'status': 'error',
                'message': 'A server error occurred. Please try again later.'
            }, status=500)

class ForgotPasswordAPIView(View):
    def post(self, request):
        try:
            mobile = request.POST.get('mobile')
            if not mobile:
                return JsonResponse({'status': 'error', 'message': 'Mobile number is required.'}, status=400)
            
            user = User.objects.filter(phone_number=mobile).first()
            if user:
                import random
                # Reset password to a random 6 digit code for temporary access
                temp_pass = str(random.randint(100000, 999999))
                user.set_password(temp_pass)
                user.save()
                
                # Log reset PIN for internal use temporarily 
                # (In production, we would integrate an SMS/Email service here)
                print(f"PASSWORD_RESET_PIN for {mobile}: {temp_pass}")
                
                return JsonResponse({
                    'status': 'success', 
                    'temp_password': temp_pass,
                    'message': f'Your temporary password is: {temp_pass}. Please use this to login and change your password in your profile.'
                })
            else:
                return JsonResponse({
                    'status': 'error', 
                    'message': 'This mobile number is not registered with us.'
                }, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': 'Failed to process request.'}, status=500)

class ProfileUpdateAPIView(View):
    def post(self, request):
        if not request.user.is_authenticated:
            return JsonResponse({'status': 'error', 'message': 'Authentication required'}, status=401)
        
        try:
            user = AuthService.update_profile(
                user=request.user, 
                data=request.POST
            )
            
            return JsonResponse({
                'status': 'success', 
                'message': 'Profile updated successfully!',
                'user': {
                    'name': user.full_name,
                    'username': user.username,
                    'mobile': user.phone_number,
                    'email': user.email
                }
            })
        except Exception as e:
            logger.error(f"Profile update exception: {str(e)}")
            return JsonResponse({
                'status': 'error', 
                'message': 'Update failed. Check your connection or contact support.'
            }, status=500)

def logout_view(request):
    logout(request)
    return redirect('home')

class AdminRegistrationView(TemplateView):
    template_name = 'users/admin_register.html'

class AdminRegistrationAPIView(View):
    def post(self, request):
        username = request.POST.get('username')
        full_name = request.POST.get('full_name')
        mobile = request.POST.get('mobile')
        email = request.POST.get('email')
        password = request.POST.get('password')

        # ALL fields mandatory
        if not all([username, full_name, mobile, email, password]):
            return JsonResponse({'status': 'error', 'message': 'Username, Full Name, Mobile No, Email, and Password are all mandatory.'}, status=400)

        # Check if Username already exists
        if User.objects.filter(username=username).exists():
            return JsonResponse({'status': 'error', 'message': 'Username already exists.'}, status=400)

        # Check if Mobile No already exists
        if User.objects.filter(phone_number=mobile).exists():
            return JsonResponse({'status': 'error', 'message': 'Mobile No already exists.'}, status=400)

        try:
            with transaction.atomic():
                # Ensure Role exists
                role, _ = Role.objects.get_or_create(name='Admin', defaults={'company_id': settings.COMPANY_ID, 'branch_id': settings.BRANCH_ID})
                
                # Create a Customer record for the Admin so they can place orders on the front-end
                customer = Customer.objects.create(
                    name=full_name,
                    contact_person=full_name,
                    contact_person_no=mobile,
                    is_online=True,
                    is_active=True,
                    created_by_id=settings.ADMIN_USER_ID
                )

                # Create user
                User.objects.create_user(
                    username=username,
                    email=email,
                    password=password,
                    full_name=full_name,
                    phone_number=mobile,
                    role=role,
                    online_customer=customer,
                    company_id=settings.COMPANY_ID,
                    branch_id=settings.BRANCH_ID,
                    created_by=settings.ADMIN_USER_ID
                )
            return JsonResponse({'status': 'success', 'message': 'Admin Registration successful! Please login to continue.'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

from django.utils import timezone
from datetime import timedelta
from django.db.models import Q

class AdminDashboardView(LoginRequiredMixin, TemplateView):
    template_name = 'admin/dashboard.html'

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_authenticated or not (request.user.role and request.user.role.name in ['Admin', 'Super Admin']):
            return redirect('home')
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        today = timezone.localtime().date()
        period = self.request.GET.get('period', 'this_week')
        
        # Base QuerySets
        sales_qs = OnlineSales.objects.all()
        orders_qs = OnlineSales.objects.all()
        customers_qs = Customer.objects.all()
        
        # Period filtering logic
        if period == 'today':
            filter_q = Q(trans_dt__date=today)
            sales_qs = sales_qs.filter(filter_q)
            orders_qs = orders_qs.filter(filter_q)
            customers_qs = customers_qs.filter(created_at__date=today)
        elif period == 'yesterday':
            yesterday = today - timedelta(days=1)
            filter_q = Q(trans_dt__date=yesterday)
            sales_qs = sales_qs.filter(filter_q)
            orders_qs = orders_qs.filter(filter_q)
            customers_qs = customers_qs.filter(created_at__date=yesterday)
        elif period == 'this_week':
            start_of_week = today - timedelta(days=today.weekday())
            filter_q = Q(trans_dt__date__gte=start_of_week)
            sales_qs = sales_qs.filter(filter_q)
            orders_qs = orders_qs.filter(filter_q)
            customers_qs = customers_qs.filter(created_at__date__gte=start_of_week)
        elif period == 'last_week':
            start_of_this_week = today - timedelta(days=today.weekday())
            start_of_last_week = start_of_this_week - timedelta(days=7)
            filter_q = Q(trans_dt__date__gte=start_of_last_week, trans_dt__date__lt=start_of_this_week)
            sales_qs = sales_qs.filter(filter_q)
            orders_qs = orders_qs.filter(filter_q)
            customers_qs = customers_qs.filter(created_at__date__gte=start_of_last_week, created_at__date__lt=start_of_this_week)
        elif period == 'this_month':
            filter_q = Q(trans_dt__year=today.year, trans_dt__month=today.month)
            sales_qs = sales_qs.filter(filter_q)
            orders_qs = orders_qs.filter(filter_q)
            customers_qs = customers_qs.filter(created_at__year=today.year, created_at__month=today.month)
        elif period == 'last_month':
            last_month_date = today.replace(day=1) - timedelta(days=1)
            filter_q = Q(trans_dt__year=last_month_date.year, trans_dt__month=last_month_date.month)
            sales_qs = sales_qs.filter(filter_q)
            orders_qs = orders_qs.filter(filter_q)
            customers_qs = customers_qs.filter(created_at__year=last_month_date.year, created_at__month=last_month_date.month)
        elif period == 'this_year':
            filter_q = Q(trans_dt__year=today.year)
            sales_qs = sales_qs.filter(filter_q)
            orders_qs = orders_qs.filter(filter_q)
            customers_qs = customers_qs.filter(created_at__year=today.year)
        elif period == 'last_year':
            filter_q = Q(trans_dt__year=today.year - 1)
            sales_qs = sales_qs.filter(filter_q)
            orders_qs = orders_qs.filter(filter_q)
            customers_qs = customers_qs.filter(created_at__year=today.year - 1)

        # Real statistics
        context['total_sales'] = sales_qs.aggregate(total=Sum('grand_amt'))['total'] or 0
        context['total_orders'] = orders_qs.count()
        context['total_completed_orders'] = OnlineSales.objects.filter(status='Delivered').count()
        context['total_customers'] = customers_qs.count()
        context['total_active_customers'] = Customer.objects.filter(is_active=True).count()
        context['total_products'] = Product.objects.filter(is_active=True).count()
        context['total_categories'] = Category.objects.filter(is_active=True).count()
        
        # Recent orders (Overall last 3 for live feed)
        context['recent_orders'] = OnlineSales.objects.all().order_by('-trans_dt')[:3].select_related('customer')
        
        context['current_period'] = period
        context['period_label'] = period.replace('_', ' ').title()
        
        return context

