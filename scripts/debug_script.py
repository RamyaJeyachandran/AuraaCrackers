from apps.users.models import User

mobile = '9003813360'
u = User.objects.filter(phone_number=mobile).first() or User.objects.filter(username=mobile).first()

if u:
    print(f"User found: {u.username}")
    print(f"Phone: {u.phone_number}")
    print(f"Is Active: {u.is_active}")
    print(f"Role: {u.role.name if u.role else 'None'}")
    print(f"Is Superuser: {u.is_superuser}")
    print(f"Is Staff: {u.is_staff}")
else:
    print(f"User with identifier {mobile} not found.")
