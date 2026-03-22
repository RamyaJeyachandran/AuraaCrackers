from celery import shared_task
from django.core.mail import send_mail
from django.conf import settings
from django.contrib.auth import get_user_model
from .models import OnlineSales

User = get_user_model()

@shared_task
def send_order_success_emails_task(user_id, order_id):
    try:
        user = User.objects.get(id=user_id)
        order = OnlineSales.objects.get(id=order_id)
        
        # 1. Customer Email
        if user.email:
            subject = f"Order Confirmation - {order.trans_no}"
            message = f"Hi {user.full_name or user.username},\n\nYour order {order.trans_no} has been placed successfully. Our team will contact you soon.\n\nTotal Amount: ₹{order.grand_amt}\n\nThank you for choosing Auraa Crackers!"
            send_mail(subject, message, settings.DEFAULT_FROM_EMAIL, [user.email], fail_silently=True)

        # 2. Admin Notification
        admin_emails = User.objects.filter(
            is_active=True,
            role__name__in=['Admin', 'Super Admin']
        ).exclude(email__isnull=True).exclude(email='').values_list('email', flat=True)
        
        if admin_emails:
            admin_subject = f"New Order Received - {order.trans_no}"
            admin_message = f"Hello Admin,\n\nA new order has been placed by {user.full_name or user.username}.\n\nOrder No: {order.trans_no}\nTotal Amount: ₹{order.grand_amt}\nCustomer Mobile: {user.phone_number or 'N/A'}\n\nPlease login to the dashboard to process the order."
            send_mail(admin_subject, admin_message, settings.DEFAULT_FROM_EMAIL, list(set(admin_emails)), fail_silently=True)
    except Exception as e:
        # Log error
        print(f"Error sending order success emails: {str(e)}")

@shared_task
def send_order_error_emails_task(user_id, error_msg):
    try:
        user = User.objects.get(id=user_id)
        subject = f"CRITICAL: Order Placement Failed - User {user.username}"
        message = f"Order failed for user {user.username} (ID: {user.id}).\n\nError: {error_msg}"
        # Send to admins
        admin_emails = [email for name, email in settings.ADMINS] if settings.ADMINS else []
        if admin_emails:
            send_mail(subject, message, settings.DEFAULT_FROM_EMAIL, admin_emails, fail_silently=True)
    except Exception as e:
        print(f"Error sending order error emails: {str(e)}")
