from apps.users.models import User
for u in User.objects.filter(role_id=3)[:10]:
    print(f"ID: {u.id}, Username: {u.username}, Role: {u.role_id}")
