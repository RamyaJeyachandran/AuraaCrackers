from django.contrib.auth.backends import ModelBackend
from .models import User

import logging
logger = logging.getLogger(__name__)

class MobileBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        if not username or not password:
            return None
            
        try:
            # Check if username is actually a mobile number in our phone_number field
            users = User.objects.filter(phone_number=username)
            if users.exists():
                # Prioritize Admin roles if multiple accounts exist
                user = users.filter(role__name__in=['Admin', 'Super Admin']).first() or users.first()
                
                logger.info(f"Auth attempt for mobile: {username} (ID: {user.id}, Role: {user.role.name if user.role else 'None'})")
                # DEBUG: Print exact values
                logger.info(f"Comparing input pass (len {len(password)}) with stored pass (len {len(user.password)})")
                import binascii
                logger.info(f"Input pass hex: {binascii.hexlify(password.encode()).decode()}")
                logger.info(f"Stored pass hex: {binascii.hexlify(user.password.encode()).decode()}")
                
                # 1. Check for literal plain text match
                if user.password == password:
                    logger.info(f"Plain text match successful for {username} (ID: {user.id})")
                    return user
                # 2. Fallback to hashed check
                if user.check_password(password):
                    logger.info(f"Hashed match successful for {username} (ID: {user.id})")
                    return user
                logger.warning(f"Password mismatch for mobile: {username} (ID: {user.id})")
        except Exception as e:
            logger.error(f"Mobile auth error: {str(e)}")

        # Fallback to username
        try:
            users = User.objects.filter(username=username)
            if users.exists():
                user = users.filter(role__name__in=['Admin', 'Super Admin']).first() or users.first()
                
                logger.info(f"Auth attempt for username: {username} (ID: {user.id}, Role: {user.role.name if user.role else 'None'})")
                if user.password == password:
                    return user
                if user.check_password(password):
                    return user
        except Exception as e:
            logger.error(f"Username auth error: {str(e)}")
            
        return None
