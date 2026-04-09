import os
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.base')
django.setup()

from django.contrib.auth import authenticate
from apps.users.models import User
import traceback

mobile = '7358377381'
password = 'Auraa@123'

print(f"Attempting auth for {mobile}")
try:
    user = authenticate(username=mobile, password=password)
    print("Authentication returned:", user)
    if user:
        print("Success!")
    else:
        print("Failed (returned None)")
except Exception:
    print("CRITICAL AUTH ERROR:")
    print(traceback.format_exc())
