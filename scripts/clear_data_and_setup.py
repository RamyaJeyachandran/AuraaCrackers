import os
import django

# Set up Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.development')
django.setup()

from apps.users.models import User, Role
from apps.crackers.models import OnlineSales

def main():
    # 1. Insert "Super Admin" role
    role, created = Role.objects.get_or_create(name="Super Admin")
    if created:
        print("SUCCESS: Role 'Super Admin' created.")
    else:
        print("INFO: Role 'Super Admin' already exists.")

    # 2. Delete all User data
    user_count = User.objects.count()
    User.objects.all().delete()
    print(f"SUCCESS: Deleted {user_count} records from the User table (tbl_users).")

    # 3. Delete all OnlineSales data
    sales_count = OnlineSales.objects.count()
    OnlineSales.objects.all().delete()
    print(f"SUCCESS: Deleted {sales_count} records from the OnlineSales table (tbl_online_sales).")

if __name__ == "__main__":
    main()
