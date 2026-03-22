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
            user = User.objects.get(phone_number=username)
            if user.check_password(password):
                return user
        except User.DoesNotExist:
            # Fallback to standard username check if mobile not found
            try:
                user = User.objects.get(username=username)
                if user.check_password(password):
                    return user
            except User.DoesNotExist:
                return None
        return None
