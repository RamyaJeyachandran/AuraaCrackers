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
            
            # Determine redirect
            next_url = request.POST.get('next', '/')
            if not next_url or next_url == 'null': next_url = '/'
            
            if user.role and user.role.name in ['Admin', 'Super Admin']:
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
        mobile = request.POST.get('mobile', '').strip()
        password = request.POST.get('password', '').strip()

        if not mobile or not password:
            return JsonResponse({'status': 'error', 'message': 'Mobile No and Password are required.'}, status=400)

        # Let our custom MobileBackend find the user by either mobile OR username!
        user = authenticate(request, username=mobile, password=password)

        if user is not None:
            if user.is_active:
                login(request, user)
                # Success - determine role and redirect
                display_name = user.full_name or user.username
                
                # Determine redirect
                next_url = request.POST.get('next', '/')
                if not next_url or next_url == 'null': next_url = '/'
                
                if user.role and user.role.name in ['Admin', 'Super Admin']:
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
                    'message': 'Secret reset instructions generated. Please contact support via WhatsApp/Email to verify and retrieve your temporary password.'
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
                role, _ = Role.objects.get_or_create(name='Admin', defaults={'company_id': settings.COMPANY_ID, 'branch_id': settings.BRANCH_ID})
                
                # Create user
                User.objects.create_user(
                    username=username,
                    email=email,
                    password=password,
                    full_name=full_name,
                    phone_number=mobile,
                    role=role,
                    online_customer=None,
                    company_id=settings.COMPANY_ID,
                    branch_id=settings.BRANCH_ID,
                    created_by=settings.ADMIN_USER_ID
                )
            return JsonResponse({'status': 'success', 'message': 'Admin Registration successful! Please login to continue.'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class AdminDashboardView(LoginRequiredMixin, TemplateView):
    template_name = 'admin/dashboard.html'

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_authenticated or not (request.user.role and request.user.role.name in ['Admin', 'Super Admin']):
            return redirect('home')
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        # Real statistics
        context['total_sales'] = OnlineSales.objects.aggregate(total=Sum('grand_amt'))['total'] or 0
        context['total_orders'] = OnlineSales.objects.count()
        context['total_customers'] = Customer.objects.count()
        context['total_products'] = Product.objects.count()
        
        # Recent orders for the dashboard feed
        context['recent_orders'] = OnlineSales.objects.all().order_by('-trans_dt')[:3].select_related('customer')
        
        return context

