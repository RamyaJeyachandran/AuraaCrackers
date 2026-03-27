import logging
from django.db import transaction
from django.contrib.auth import authenticate, login
from django.conf import settings
from .models import User, Role
from apps.crackers.models import Customer, CustomerAddress

logger = logging.getLogger(__name__)

class AuthService:
    """
    Handles user lifecycle events including registration, profile synchronization, 
    and authentication orchestration.
    """

    @staticmethod
    def register_customer(data):
        """
        Atomically creates a User, a Customer profile, and a default Shipping Address.
        """
        full_name = data.get('full_name')
        email = data.get('email')
        mobile = data.get('mobile')
        password = data.get('password')
        address1 = data.get('address1')
        address2 = data.get('address2')
        pincode = data.get('pincode')
        country_id = data.get('country_id', 1)
        state_id = data.get('state_id')
        city_name = data.get('city_name')

        try:
            with transaction.atomic():
                # 1. Ensure Role exists
                role, _ = Role.objects.get_or_create(
                    name='Online Customers', 
                    defaults={
                        'company_id': settings.COMPANY_ID, 
                        'branch_id': settings.BRANCH_ID
                    }
                )
                
                # 2. Create or sync Customer Profile
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
                
                # 3. Create Default Shipping Address
                CustomerAddress.objects.create(
                    customer=customer,
                    address1=address1,
                    address2=address2,
                    country_id=country_id,
                    state_id=state_id,
                    city_name=city_name,
                    pincode=pincode,
                    phone=mobile,
                    email=email,
                    is_shipping_default=True,
                    is_active=True,
                    created_by_id=settings.ADMIN_USER_ID
                )

                # 4. Create Authentication User
                user = User.objects.create_user(
                    username=mobile,
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
                
                logger.info(f"New customer registered: {mobile} ({full_name})")
                return user

        except Exception as e:
            logger.error(f"Registration failed for {mobile}: {str(e)}")
            raise e

    @staticmethod
    def update_profile(user, data):
        """
        Synchronizes profile updates across User and Customer models.
        """
        name = data.get('name')
        email = data.get('email')
        new_password = data.get('new_password')
        address1 = data.get('address1')
        address2 = data.get('address2')
        state_id = data.get('state_id')
        city_name = data.get('city_name')
        pincode = data.get('pincode')

        try:
            with transaction.atomic():
                # Update Auth User
                user.full_name = name
                user.email = email
                if new_password:
                    user.set_password(new_password)
                user.save()

                # Update Linked Customer
                if user.online_customer:
                    customer = user.online_customer
                    customer.name = name
                    customer.contact_person = name
                    customer.save()

                    # Update Default Address
                    addr = CustomerAddress.objects.filter(
                        customer=customer, 
                        is_shipping_default=True
                    ).first()
                    if addr:
                        addr.address1 = address1
                        addr.address2 = address2
                        addr.state_id = state_id
                        addr.city_name = city_name
                        addr.pincode = pincode
                        addr.email = email
                        addr.save()
                
                logger.info(f"Profile updated for user: {user.username}")
                return user
        except Exception as e:
            logger.error(f"Profile update failed for {user.username}: {str(e)}")
            raise e
