from django.contrib.auth.backends import ModelBackend
from .models import User

class MobileBackend(ModelBackend):
    """
    Custom authentication backend that allows users to log in using their 
    mobile number (phone_number field) instead of username.
    """
    def authenticate(self, request, username=None, password=None, **kwargs):
        if not username or not password:
            return None
            
        try:
            # Check if username is actually a mobile number in our phone_number field
            # Use filter().first() instead of get() to handle cases where multiple users might share a number (legacy data issues)
            user = User.objects.filter(phone_number=username).first()
            if user and user.check_password(password):
                return user
        except Exception:
            # Fallback to standard username check if mobile not found or error
            try:
                # Use filter().first() instead of get() to be resilient against duplicate usernames
                user = User.objects.filter(username=username).first()
                if user and user.check_password(password):
                    return user
            except Exception:
                return None
        return None
