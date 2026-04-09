import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.development')
django.setup()

from apps.users.models import User

print("--- User List ---")
for u in User.objects.all():
    print(f"ID: {u.id} | Username: '{u.username}' | Phone: '{u.phone_number}' | FullName: '{u.full_name}'")
