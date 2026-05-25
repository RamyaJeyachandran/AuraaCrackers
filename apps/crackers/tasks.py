from celery import shared_task
from django.core.mail import send_mail
from django.conf import settings
from django.contrib.auth import get_user_model
from .models import OnlineSales, Testimonial
import os
import requests
import logging
from apify_client import ApifyClient
from django.core.cache import cache

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

@shared_task
def fetch_google_reviews_task():
    """
    Automated task to fetch reviews from Google Maps via Apify.
    Runs periodically via Celery Beat.
    """
    apify_token = os.environ.get('APIFY_TOKEN')
    if not apify_token:
        return "APIFY_TOKEN not found in environment."

    try:
        client = ApifyClient(apify_token)
        run_input = {
            "startUrls": [
                {
                    "url": "https://www.google.com/maps/place/Auraa+Crackers+Sivakasi/@9.3992778,77.7821944,17z/data=!3m1!4b1!4m6!3m5!1s0x3b06c9aa9b9f4741:0xd082609f94bf72c!8m2!3d9.3992778!4d77.7821944!16s%2Fg%2F11l36k70mx"
                }
            ],
            "maxReviews": 50,
            "reviewsSort": "newest"
        }

        # Run the actor
        run = client.actor("compass/google-maps-reviews-scraper").call(run_input=run_input)
        
        reviews_count = 0
        for item in client.dataset(run["defaultDatasetId"]).iterate_items():
            rating = item.get("stars") or item.get("rating")
            
            if rating and rating >= 4:
                name = item.get("name") or "Anonymous Reviewer"
                text = item.get("text") or ""
                profile_image = item.get("reviewerPhotoUrl")
                if not profile_image:
                    profile_image = f"https://api.dicebear.com/7.x/initials/svg?seed={name}"
                
                review_date = item.get("publishedAtDate") or item.get("relativeTime") or "Recent"
                
                Testimonial.objects.update_or_create(
                    name=name,
                    text=text,
                    defaults={
                        'profile_image': profile_image,
                        'rating': int(rating),
                        'review_date': str(review_date),
                        'isActive': True
                    }
                )
                reviews_count += 1

        # Clear cache
        cache.delete('testimonials_data_fragment')
        return f"Successfully processed {reviews_count} reviews."
        
    except Exception as e:
        return f"Error in fetch_google_reviews_task: {str(e)}"

@shared_task
def trigger_n8n_order_webhook_task(order_id):
    """
    Webhook disabled.
    """
    return "Webhook disabled."

# Original implementation (commented out for reference):
# def trigger_n8n_order_webhook_task_original(order_id):
#     webhook_url = getattr(settings, 'N8N_ORDER_WEBHOOK_URL', None)
#     if not webhook_url:
#         return "N8N_ORDER_WEBHOOK_URL not configured."
#     try:
#         order = OnlineSales.objects.select_related('customer', 'customer_address').get(id=order_id)
#         items = order.items.all().select_related('product')
#         customer = order.customer
#         address = order.customer_address
#         customer_email = getattr(customer, 'email', None)
#         if not customer_email:
#             try:
#                 if customer.created_by:
#                     customer_email = customer.created_by.email
#             except Exception:
#                 customer_email = None
#         payload = {
#             "order": {
#                 "id": order.id,
#                 "trans_no": order.trans_no,
#                 "trans_dt": order.trans_dt.isoformat() if order.trans_dt else None,
#                 "status": order.status,
#                 "total_amt": float(order.total_amt),
#                 "discount": float(order.discount),
#                 "round_amt": float(order.round_amt),
#                 "grand_amt": float(order.grand_amt),
#                 "promo_code": order.promo_code,
#                 "promo_per": float(order.promo_per) if order.promo_per else 0,
#             },
#             "customer": {
#                 "id": customer.id,
#                 "name": customer.name,
#                 "email": customer_email,
#                 "phone": customer.contact_person_no,
#                 "company": customer.company,
#             },
#             "shipping_address": {
#                 "address1": address.address1 if address else None,
#                 "address2": address.address2 if address else None,
#                 "city": address.city_name if address else None,
#                 "pincode": address.pincode if address else None,
#                 "phone": address.phone if address else None,
#             },
#             "items": [
#                 {
#                     "product_name": item.item_name,
#                     "product_code": item.item_code,
#                     "qty": float(item.qty),
#                     "rate": float(item.rate),
#                     "mrp": float(item.mrp),
#                     "item_total": float(item.item_total),
#                 } for item in items
#             ]
#         }
#         response = requests.post(webhook_url, json=payload, timeout=10)
#         response.raise_for_status()
#         return f"Successfully sent order {order.trans_no} to n8n. Status: {response.status_code}"
#     except OnlineSales.DoesNotExist:
#         return f"Order with ID {order_id} not found."
#     except Exception as e:
#         return f"Error sending order to n8n: {str(e)}"
