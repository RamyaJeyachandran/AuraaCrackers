import os
import django
from django.conf import settings
from django.contrib.auth.hashers import make_password, is_password_usable
from apps.users.models import User

users = User.objects.all()
count = 0

print(f"Checking {len(users)} users for plain text passwords...")

for user in users:
    # Django passwords normally start with a hash identifier like pbkdf2_sha256$
    if user.password and '$' not in user.password:
        plain_password = user.password
        user.password = make_password(plain_password)
        user.save()
        count += 1
        if count % 100 == 0:
            print(f"Hashed {count} passwords...")

print(f"Successfully hashed {count} plain text passwords.")
