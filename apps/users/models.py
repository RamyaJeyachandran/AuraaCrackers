from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.conf import settings

class Role(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True, db_column='descr')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyid', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchid', default=settings.BRANCH_ID)
    is_active = models.BooleanField(default=True, db_column='isactive')
    created_by = models.IntegerField(null=True, blank=True, db_column='createdby', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createddt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updateddt')
    updated_by = models.IntegerField(null=True, blank=True, db_column='updatedby')

    class Meta:
        db_table = 'tbl_role'

    def __str__(self):
        return self.name

class UserManager(BaseUserManager):
    def create_user(self, username, phone_number, password=None, **extra_fields):
        if not phone_number:
            raise ValueError('The Mobile Number must be set')
        user = self.model(username=username, phone_number=phone_number, **extra_fields)
        if password:
            user.set_password(password)
        else:
            user.set_unusable_password()
        user.save(using=self._db)
        return user

    def create_superuser(self, username, phone_number, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(username, phone_number, password, **extra_fields)

class User(AbstractBaseUser):
    # Explicitly map fields to match the legacy database columns
    password = models.CharField(max_length=128, db_column='password')
    username = models.CharField(max_length=150, unique=True, db_column='username') # Maps to tbl_users.userName
    full_name = models.CharField(max_length=255, db_column='fullname')
    email = models.EmailField(unique=True, db_column='emailid', null=True, blank=True)
    phone_number = models.CharField(max_length=15, unique=True, db_column='mobileno')
    
    role = models.ForeignKey(Role, on_delete=models.SET_NULL, null=True, blank=True, db_column='roleid')
    online_customer = models.ForeignKey('crackers.Customer', on_delete=models.SET_NULL, null=True, blank=True, db_column='onlinecustomerid', related_name='users')
    
    is_active = models.BooleanField(default=True, db_column='isactive')
    last_login = models.DateTimeField(null=True, blank=True, db_column='lastlogin')
    
    company_id = models.IntegerField(null=True, blank=True, db_column='companyid', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchid', default=settings.BRANCH_ID)
    password_reset_token = models.CharField(max_length=255, null=True, blank=True, db_column='passwordresettoken')
    
    created_by = models.IntegerField(null=True, blank=True, db_column='createdby', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createddt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updateddt')
    updated_by = models.IntegerField(null=True, blank=True, db_column='updatedby')
    
    # Non-DB specific properties
    @property
    def is_staff(self):
        return self.role and self.role.name in ['Admin', 'Super Admin']
        
    @property
    def is_superuser(self):
        return self.role and self.role.name == 'Super Admin'

    objects = UserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['phone_number']

    class Meta:
        db_table = 'tbl_users'
        managed = False

    def __str__(self):
        return self.username
