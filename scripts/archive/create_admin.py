from apps.users.models import User, Role

mobile = '9003813360'
role, _ = Role.objects.get_or_create(name='Admin')

u = User.objects.filter(phone_number=mobile).first() or User.objects.filter(username=mobile).first()

if not u:
    u = User.objects.create_user(
        username=mobile,
        email='admin@auraacrackers.com',
        password='adminpassword',
        user_name='Store Admin',
        full_name='Admin User',
        phone_number=mobile,
        role=role,
        is_active=True,
        is_staff=True,
        is_superuser=True
    )
    print(f"Created new admin user. Mobile: {mobile}, Password: adminpassword")
else:
    u.set_password('adminpassword')
    u.is_active = True
    u.role = role
    u.is_staff = True
    u.is_superuser = True
    u.save()
    print(f"Reset existing admin user. Mobile: {mobile}, Password: adminpassword")
