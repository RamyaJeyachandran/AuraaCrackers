from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User, Role

@admin.register(Role)
class RoleAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'is_active')
    search_fields = ('name',)

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'full_name', 'email', 'phone_number', 'role', 'is_active')
    list_filter = ('role', 'is_active')
    search_fields = ('username', 'full_name', 'email', 'phone_number')
    ordering = ('username',)
    
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        ('Profile Information', {'fields': ('full_name', 'phone_number', 'email', 'address', 'state', 'city', 'pincode')}),
        ('Role & Setup', {'fields': ('role', 'online_customer', 'company_id', 'branch_id', 'is_active')}),
        ('Audit', {'fields': ('created_by', 'created_at', 'updated_at', 'updated_by')}),
    )
    readonly_fields = ('created_at', 'updated_at')
