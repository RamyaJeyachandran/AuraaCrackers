from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate, logout
from django.views.generic import TemplateView, View
from django.http import JsonResponse
from django.db import IntegrityError, transaction
from .models import User, Role
from apps.crackers.models import Product, Category, Customer, CustomerAddress, Company, Branch, OnlineSales
from django.db.models import Sum

from django.contrib.auth.mixins import LoginRequiredMixin
from django.conf import settings

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
        full_name = request.POST.get('full_name')
        username = request.POST.get('username')
        email = request.POST.get('email')
        mobile = request.POST.get('mobile')
        password = request.POST.get('password')
        address = request.POST.get('address')
        pincode = request.POST.get('pincode')
        country_id = request.POST.get('country_id', 1)
        state_id = request.POST.get('state_id')
        city_id = request.POST.get('city_id')

        # Basic Validation
        if not full_name or not username or not mobile or not password:
            return JsonResponse({'status': 'error', 'message': 'Full Name, User Name, Mobile No and Password are mandatory fields.'}, status=400)

        # Check if Username or Mobile No already exists
        if User.objects.filter(username=username).exists():
            return JsonResponse({'status': 'error', 'message': 'This User Name is already taken.'}, status=400)
        
        if User.objects.filter(phone_number=mobile).exists():
            return JsonResponse({'status': 'error', 'message': 'This Mobile No is already registered.'}, status=400)

        try:
            with transaction.atomic():
                # Get default role (Online Customers)
                role, _ = Role.objects.get_or_create(name='Online Customers', defaults={'company_id': settings.COMPANY_ID, 'branch_id': settings.BRANCH_ID})
                
                # Check if Customer with this mobile already exists
                customer = Customer.objects.filter(contact_person_no=mobile).first()
                if not customer:
                    customer = Customer.objects.create(
                        name=full_name,
                        contact_person=full_name,
                        contact_person_no=mobile,
                        is_online=True,
                        is_active=True,
                        created_by_id=settings.ADMIN_USER_ID
                    )
                
                # Create Customer Address as Default Shipping
                CustomerAddress.objects.create(
                    customer=customer,
                    address1=address if address else "Default Address",
                    country_id=country_id,
                    state_id=state_id,
                    city_id=city_id,
                    pincode=pincode if pincode else "",
                    phone=mobile,
                    email=email,
                    is_shipping_default=True,
                    is_active=True,
                    created_by_id=settings.ADMIN_USER_ID
                )

                # Use default company/branch
                company_id = settings.COMPANY_ID
                branch_id = settings.BRANCH_ID

                # Create user using mobile as internal username
                user = User.objects.create_user(
                    username=username,
                    email=email,
                    password=password,
                    full_name=full_name,
                    phone_number=mobile,
                    role=role,
                    online_customer=customer,
                    company_id=company_id,
                    branch_id=branch_id,
                    created_by=settings.ADMIN_USER_ID
                )
            return JsonResponse({'status': 'success', 'message': 'Registration successful! Please login to continue.'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class LoginAPIView(View):
    def post(self, request):
        mobile = request.POST.get('mobile', '').strip()
        password = request.POST.get('password', '').strip()

        if not mobile or not password:
            return JsonResponse({'status': 'error', 'message': 'Mobile No and Password are required.'}, status=400)

        if not mobile or not password:
            return JsonResponse({'status': 'error', 'message': 'Mobile No and Password are required.'}, status=400)

        # Let our custom MobileBackend find the user by either mobile OR username!
        user = authenticate(request, username=mobile, password=password)

        if user is not None:
            if user.is_active:
                login(request, user)
                # Success - determine role and redirect
                display_name = user.full_name or user.username
                
                redirect_url = '/'
                if user.role and user.role.name in ['Admin', 'Super Admin']:
                    redirect_url = '/admin/dashboard/'
                
                return JsonResponse({
                    'status': 'success', 
                    'message': f'Welcome back, {display_name}!', 
                    'redirect': redirect_url
                })
            else:
                return JsonResponse({'status': 'error', 'message': 'Account is disabled.'}, status=403)
        else:
            return JsonResponse({'status': 'error', 'message': 'Invalid Mobile No or Password.'}, status=401)

@method_decorator(csrf_exempt, name='dispatch')
class ForgotPasswordAPIView(View):
    def post(self, request):
        try:
            mobile = request.POST.get('mobile')
            if not mobile:
                return JsonResponse({'status': 'error', 'message': 'Mobile number is required.'}, status=400)
            
            user = User.objects.filter(phone_number=mobile).first()
            if user:
                import random
                # Reset password to a random 6 digit code
                temp_pass = str(random.randint(100000, 999999))
                user.set_password(temp_pass)
                user.save()
                return JsonResponse({
                    'status': 'success', 
                    'message': f'Security reset successful! Your temporary password is: {temp_pass}. Please use this to login and then change your password in your profile settings.'
                })
            else:
                return JsonResponse({
                    'status': 'error', 
                    'message': 'This mobile number is not registered with us.'
                }, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': f'Server Error: {str(e)}'}, status=500)

class ProfileUpdateAPIView(View):
    def post(self, request):
        if not request.user.is_authenticated:
            return JsonResponse({'status': 'error', 'message': 'Authentication required'}, status=401)
        
        user = request.user
        name = request.POST.get('name')
        user_name = request.POST.get('user_name')
        username = request.POST.get('username')
        mobile = request.POST.get('mobile')
        email = request.POST.get('email')
        address = request.POST.get('address')
        state_id = request.POST.get('state_id')
        city_id = request.POST.get('city_id')
        pincode = request.POST.get('pincode')
        new_password = request.POST.get('new_password')
        confirm_password = request.POST.get('confirm_password')

        if not name:
            return JsonResponse({'status': 'error', 'message': 'Full Name is mandatory.'}, status=400)

        if new_password:
            if new_password != confirm_password:
                return JsonResponse({'status': 'error', 'message': 'New passwords do not match.'}, status=400)
            if len(new_password) < 6:
                return JsonResponse({'status': 'error', 'message': 'Password must be at least 6 characters.'}, status=400)

        # Uniqueness checks for Admin/Management fields
        if username and username != user.username:
            if User.objects.filter(username=username).exclude(id=user.id).exists():
                return JsonResponse({'status': 'error', 'message': 'This login username is already taken.'}, status=400)
            user.username = username

        # Mobile number is readonly and cannot be updated

        try:
            with transaction.atomic():
                user.full_name = name
                user.email = email
                if new_password:
                    user.set_password(new_password)
                user.save()

                if user.online_customer:
                    user.online_customer.name = name
                    user.online_customer.contact_person = name
                    user.online_customer.save()

                    # Sync with the primary address
                    addr = CustomerAddress.objects.filter(customer=user.online_customer, is_shipping_default=True).first()
                    if addr:
                        addr.address1 = address
                        addr.state_id = state_id
                        addr.city_id = city_id
                        addr.pincode = pincode
                        addr.email = email
                        addr.save()
            
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
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

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

from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def delete_all_users_view(request):
    """TEMPORARY VIEW TO DELETE ALL USERS VIA BROWSER"""
    count = User.objects.count()
    User.objects.all().delete()
    return JsonResponse({'status': 'success', 'message': f'Deleted {count} users successfully.'})
