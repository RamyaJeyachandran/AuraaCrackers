import os
import django

# Set up Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.development')
django.setup()

from apps.users.models import User, Role

def main():
    # 1. Get the Super Admin role
    role, created = Role.objects.get_or_create(name="Super Admin")
    
    # 2. Extract user details provided by the user
    # User requested:
    # userName - Auraa Admin (mapped to django username for login)
    # full name - Auraa Crackers Admin
    # mobileNo - 7358377381
    # EmailId - ramyaworkac@gmail.com
    # password - Auraa@123
    
    user_data = {
        'username': 'Auraa Admin', 
        'user_name': 'Auraa Admin',
        'full_name': 'Auraa Crackers Admin',
        'phone_number': '7358377381',
        'email': 'ramyaworkac@gmail.com',
        'role': role
    }
    password = 'Auraa@123'

    # 3. Create or update user
    # Since we previously created one with username=7358377381, let's delete it first to avoid confusion if it exists
    User.objects.filter(phone_number=user_data['phone_number']).delete()

    user = User.objects.create_user(
        username=user_data['username'],
        email=user_data['email'],
        password=password,
        user_name=user_data['user_name'],
        full_name=user_data['full_name'],
        phone_number=user_data['phone_number'],
        role=user_data['role'],
        is_staff=True,
        is_superuser=True
    )

    print(f"SUCCESS: User '{user.username}' created with mobile '{user.phone_number}' and Super Admin role.")

if __name__ == "__main__":
    main()
