from django.contrib.auth.models import User
from apps.users.models import User as AuraaUser
from django.contrib.auth.hashers import make_password
from django.db import connection

mobileno = '7358377381'
new_pass = 'Auraa@123'
hashed = make_password(new_pass)

with connection.cursor() as cursor:
    cursor.execute("UPDATE tbl_users SET password = %s WHERE mobileno = %s", [hashed, mobileno])
    print(f"Updated password for {mobileno} (hashed)")
