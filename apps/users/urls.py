from django.urls import path
from .views import (
    LoginView, logout_view, LoginAPIView, SignupAPIView, ProfileUpdateAPIView, ProfileView,
    AdminRegistrationView, AdminRegistrationAPIView, AdminDashboardView, 
    ForgotPasswordAPIView
)

urlpatterns = [
    path('login/', LoginView.as_view(), name='login'),
    path('profile/', ProfileView.as_view(), name='profile'),
    path('logout/', logout_view, name='logout'),
    path('admin/register/', AdminRegistrationView.as_view(), name='admin_register'),
    path('admin/dashboard/', AdminDashboardView.as_view(), name='admin_dashboard'),
    path('api/login/', LoginAPIView.as_view(), name='api_login'),
    path('api/signup/', SignupAPIView.as_view(), name='api_signup'),
    path('api/admin/register/', AdminRegistrationAPIView.as_view(), name='api_admin_register'),
    path('api/profile/update/', ProfileUpdateAPIView.as_view(), name='api_profile_update'),
    path('api/forgot-password/', ForgotPasswordAPIView.as_view(), name='api_forgot_password'),
]
