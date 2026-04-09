import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.development')
django.setup()

from apps.users.models import User

# DELETING ALL USERS
count = User.objects.count()
User.objects.all().delete()
print(f"SUCCESS: Deleted {count} records from the User table.")
