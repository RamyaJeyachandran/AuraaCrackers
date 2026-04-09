import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.development')
django.setup()

from apps.users.models import User

mobile = '7358377381'
password = 'Auraa@123'

user = User.objects.filter(phone_number=mobile).first()
if user:
    user.set_password(password)
    user.save()
    print(f"SUCCESS: Password for {mobile} (Username: {user.username}) has been reset to {password}")
else:
    print(f"ERROR: User with mobile {mobile} not found in database.")
