from django.contrib import admin
from .models import Unit, Category, Product, Customer, OnlineSales, OnlineSalesItem, Coupon, CustomerAddress, Country, State, City, WebsiteList

@admin.register(Unit)
class UnitAdmin(admin.ModelAdmin):
    list_display = ('name', 'code', 'is_active')
    search_fields = ('name', 'code')

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'order', 'is_active')
    search_fields = ('name',)

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'code', 'price', 'category', 'is_active')
    list_filter = ('category', 'is_active')
    search_fields = ('name', 'code')

class CustomerAddressInline(admin.TabularInline):
    model = CustomerAddress
    extra = 1

@admin.register(Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = ('name', 'company', 'contact_person', 'contact_person_no', 'balance', 'is_active')
    search_fields = ('name', 'company', 'contact_person')
    list_filter = ('is_active', 'is_online')
    inlines = [CustomerAddressInline]

@admin.register(CustomerAddress)
class CustomerAddressAdmin(admin.ModelAdmin):
    list_display = ('customer', 'address1', 'city_name', 'pincode', 'is_shipping_default', 'is_active')
    search_fields = ('customer__name', 'address1', 'phone', 'email')
    list_filter = ('is_active', 'is_shipping_default')

class OnlineSalesItemInline(admin.TabularInline):
    model = OnlineSalesItem
    extra = 1

@admin.register(OnlineSales)
class OnlineSalesAdmin(admin.ModelAdmin):
    list_display = ('trans_no', 'customer', 'customer_address', 'trans_dt', 'status', 'promo_code', 'promo_per', 'grand_amt', 'is_active')
    list_filter = ('status', 'is_active')
    search_fields = ('trans_no', 'customer__name')
    inlines = [OnlineSalesItemInline]

@admin.register(OnlineSalesItem)
class OnlineSalesItemAdmin(admin.ModelAdmin):
    list_display = ('item_name', 'online_sales', 'qty', 'rate', 'item_total')
    list_filter = ('online_sales__status',)
    search_fields = ('item_name', 'item_code')
@admin.register(Coupon)
class CouponAdmin(admin.ModelAdmin):
    list_display = ('name', 'code', 'percentage', 'website_id', 'is_active')
    search_fields = ('name', 'code')
    list_filter = ('is_active', 'website_id')

@admin.register(Country)
class CountryAdmin(admin.ModelAdmin):
    list_display = ('name', 'code', 'is_active')

@admin.register(State)
class StateAdmin(admin.ModelAdmin):
    list_display = ('name', 'country', 'is_active')

@admin.register(City)
class CityAdmin(admin.ModelAdmin):
    list_display = ('name', 'state', 'is_active')

@admin.register(WebsiteList)
class WebsiteListAdmin(admin.ModelAdmin):
    list_display = ('id', 'website_name', 'company_id', 'is_active')
