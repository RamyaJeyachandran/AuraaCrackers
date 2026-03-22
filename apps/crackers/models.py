from django.db import models
from django.conf import settings

class Country(models.Model):
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=10, blank=True, null=True)
    is_active = models.BooleanField(default=True, db_column='isActive')
    created_by = models.IntegerField(null=True, blank=True, db_column='createdBy', default=1)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')

    class Meta:
        db_table = 'tbl_country'

    def __str__(self):
        return self.name

class State(models.Model):
    country = models.ForeignKey(Country, on_delete=models.CASCADE, db_column='countryId')
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=10, blank=True, null=True)
    is_active = models.BooleanField(default=True, db_column='isActive')
    created_by = models.IntegerField(null=True, blank=True, db_column='createdBy', default=1)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')

    class Meta:
        db_table = 'tbl_state'

    def __str__(self):
        return self.name

class City(models.Model):
    state = models.ForeignKey(State, on_delete=models.CASCADE, db_column='stateId')
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=10, blank=True, null=True)
    is_active = models.BooleanField(default=True, db_column='isActive')
    created_by = models.IntegerField(null=True, blank=True, db_column='createdBy', default=1)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')

    class Meta:
        db_table = 'tbl_city'

    def __str__(self):
        return self.name

class WebsiteList(models.Model):
    website_name = models.CharField(max_length=255, db_column='websiteName')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    is_active = models.BooleanField(default=True, db_column='isActive')
    created_by = models.IntegerField(null=True, blank=True, db_column='createdBy', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_by = models.IntegerField(null=True, blank=True, db_column='updatedBy')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')

    class Meta:
        db_table = 'tbl_websitelist'

    def __str__(self):
        return self.website_name

class Unit(models.Model):
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=20)
    description = models.TextField(blank=True, null=True, db_column='descr')
    conv_factor = models.DecimalField(max_digits=15, decimal_places=6, default=1.000000, db_column='convFactor')
    company_id = models.IntegerField(blank=True, null=True, db_column='companyId', default=1)
    branch_id = models.IntegerField(blank=True, null=True, db_column='branchId', default=1)
    is_active = models.BooleanField(default=True, db_index=True, db_column='isActive')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='createdBy', related_name='unit_created', default=1)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='updatedBy', related_name='unit_updated')

    class Meta:
        db_table = 'tbl_units'

    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField(max_length=150, db_index=True, db_column='categoryName')
    image = models.URLField(max_length=255, blank=True, null=True, db_column='categoryImage')
    order = models.IntegerField(default=0, db_index=True, db_column='sortNo')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    is_active = models.BooleanField(default=True, db_index=True, db_column='isActive')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='createdBy', related_name='category_created', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='updatedBy', related_name='category_updated')

    class Meta:
        verbose_name_plural = "Categories"
        db_table = 'tbl_category'

    def __str__(self):
        return self.name

class Product(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products', db_column='categoryId')
    code = models.CharField(max_length=50, db_index=True, blank=True, null=True, db_column='itemCode')
    name = models.CharField(max_length=150, db_index=True, db_column='itemName')
    item_type = models.CharField(max_length=1, default='G', db_column='itemType') # G=Good, S=Services, Y=Assembly, B=Bundled
    unit = models.ForeignKey(Unit, on_delete=models.SET_NULL, blank=True, null=True, db_column='unitId', related_name='products')
    is_sales = models.IntegerField(default=1, db_column='isSales')
    price = models.DecimalField(max_digits=15, decimal_places=2, db_index=True, db_column='saleRate')
    description = models.TextField(blank=True, null=True, db_column='saleDesc')
    purchase_rate = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='purchaseRate')
    original_price = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True, db_column='mrp')
    tax_id = models.IntegerField(blank=True, null=True, db_column='taxId')
    account_id = models.IntegerField(blank=True, null=True, db_column='accountId')
    min_ord_qty = models.DecimalField(max_digits=15, decimal_places=3, default=0.000, db_column='minOrdQty')
    discount_per = models.DecimalField(max_digits=5, decimal_places=2, default=0.00, db_column='discountPer')
    discount = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='discount')
    free_qty = models.DecimalField(max_digits=15, decimal_places=3, default=0.000, db_column='freeQty')
    location_id = models.IntegerField(blank=True, null=True, db_column='locationId')
    opening_qty = models.DecimalField(max_digits=15, decimal_places=3, default=0.000, db_column='openingQty')
    sort_no = models.IntegerField(default=0, db_column='sortNo')
    image = models.URLField(max_length=1000, blank=True, null=True, db_column='itemImage')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    is_active = models.BooleanField(default=True, db_index=True, db_column='isActive')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='createdBy', related_name='product_created', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='updatedBy', related_name='product_updated')

    is_disabled = models.IntegerField(default=0, db_column='isDisabled')

    class Meta:
        db_table = 'tbl_items'
        indexes = [
            models.Index(fields=['name', 'category']),
            models.Index(fields=['code']),
        ]

    def __str__(self):
        return self.name

class Cart(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='cart_items', db_column='userId')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, db_column='itemId')
    quantity = models.PositiveIntegerField(default=1)
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    is_active = models.IntegerField(default=1, db_column='isActive')
    created_by = models.IntegerField(null=True, blank=True, db_column='createdBy', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.IntegerField(null=True, blank=True, db_column='updatedBy')

    class Meta:
        db_table = 'tbl_cart'
        unique_together = ('user', 'product')

    def __str__(self):
        return f"{self.user.username}'s cart: {self.product.name} ({self.quantity})"

    @property
    def total_price(self):
        return self.product.price * self.quantity

class Customer(models.Model):
    name = models.CharField(max_length=200, db_column='name')
    company = models.CharField(max_length=200, blank=True, null=True, db_column='company')
    contact_person = models.CharField(max_length=150, blank=True, null=True, db_column='contactPerson')
    contact_person_no = models.CharField(max_length=20, blank=True, null=True, db_column='contactPersonNo')
    account_id = models.IntegerField(blank=True, null=True, db_column='accountId')
    balance = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='balance')
    tax_id = models.CharField(max_length=50, blank=True, null=True, db_column='taxId')
    is_online = models.BooleanField(default=True, db_column='isOnline')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    website_id = models.IntegerField(null=True, blank=True, db_column='websiteId', default=settings.WEBSITE_ID)
    is_active = models.BooleanField(default=True, db_index=True, db_column='isActive')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='createdBy', related_name='%(class)s_created', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='updatedBy', related_name='customer_updated')

    class Meta:
        db_table = 'tbl_customer'

    def __str__(self):
        return self.name

class OnlineSales(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customerid', related_name='sales')
    customer_address = models.ForeignKey('CustomerAddress', on_delete=models.SET_NULL, blank=True, null=True, db_column='customeraddrid', related_name='sales')
    trans_no = models.CharField(max_length=50, unique=True, db_column='transno')
    trans_dt = models.DateTimeField(db_column='transdt')
    status = models.CharField(max_length=20, default='New', db_column='status') 
    promo_per = models.DecimalField(max_digits=5, decimal_places=2, default=0.00, db_column='discountper')
    promo_code = models.CharField(max_length=50, blank=True, null=True, db_column='discountcode')
    discount = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='discount')
    total_amt = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='totalamt')
    round_amt = models.DecimalField(max_digits=5, decimal_places=2, default=0.00, db_column='roundamt')
    grand_amt = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='grandAmt')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    website_id = models.IntegerField(null=True, blank=True, db_column='websiteId', default=settings.WEBSITE_ID)
    is_active = models.BooleanField(default=True, db_index=True, db_column='isActive')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='createdBy', related_name='sale_created', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='updatedBy', related_name='sale_updated')

    @property
    def sub_total(self):
        import decimal
        return self.total_amt - self.discount

    @property
    def calculated_packing_charges(self):
        import decimal
        return self.sub_total * decimal.Decimal('0.03')

    class Meta:
        db_table = 'tbl_online_sales'
        managed = False
        verbose_name_plural = "Online Sales"

    def __str__(self):
        return self.trans_no

class OnlineSalesItem(models.Model):
    online_sales = models.ForeignKey(OnlineSales, on_delete=models.CASCADE, db_column='onlineSalesId', related_name='items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, db_column='itemId')
    item_name = models.CharField(max_length=200, db_column='itemName')
    item_code = models.CharField(max_length=50, blank=True, null=True, db_column='itemCode')
    rate = models.DecimalField(max_digits=15, decimal_places=2, db_column='rate')
    mrp = models.DecimalField(max_digits=15, decimal_places=2, db_column='mrp')
    qty = models.DecimalField(max_digits=15, decimal_places=3, db_column='qty')
    free_qty = models.DecimalField(max_digits=15, decimal_places=3, default=0.000, db_column='freeQty')
    discount_per = models.DecimalField(max_digits=5, decimal_places=2, default=0.00, db_column='discountPer')
    discount_amt = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='discountAmt')
    unit = models.CharField(max_length=50, blank=True, null=True, db_column='unit')
    tax_per = models.DecimalField(max_digits=5, decimal_places=2, default=0.00, db_column='taxPer')
    tax_name = models.CharField(max_length=100, blank=True, null=True, db_column='taxName')
    tax_amt = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='taxAmt')
    item_total = models.DecimalField(max_digits=15, decimal_places=2, db_column='itemTotal')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    is_active = models.BooleanField(default=True, db_index=True, db_column='isActive')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='createdBy', related_name='sale_item_created', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='updatedBy', related_name='sale_item_updated')

    class Meta:
        db_table = 'tbl_onlinesales_items'

    def __str__(self):
        return f"{self.item_name} ({self.qty})"

class Coupon(models.Model):
    name = models.CharField(max_length=150, db_column='couponName')
    code = models.CharField(max_length=50, unique=True, db_column='couponCode')
    percentage = models.DecimalField(max_digits=5, decimal_places=2, default=0.00, db_column='couponPer')
    description = models.TextField(blank=True, null=True, db_column='description')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    website_id = models.IntegerField(null=True, blank=True, db_column='websiteId', default=settings.WEBSITE_ID)
    is_active = models.BooleanField(default=True, db_index=True, db_column='isActive')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='createdBy', related_name='coupon_created', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='updatedBy', related_name='coupon_updated')

    class Meta:
        db_table = 'tbl_coupons'

    def __str__(self):
        return f"{self.name} ({self.code})"

class CustomerAddress(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, db_column='customerId', related_name='addresses')
    address1 = models.CharField(max_length=255, db_column='address1')
    address2 = models.CharField(max_length=255, blank=True, null=True, db_column='address2')
    country = models.ForeignKey(Country, on_delete=models.SET_NULL, blank=True, null=True, db_column='countryId')
    state = models.ForeignKey(State, on_delete=models.SET_NULL, blank=True, null=True, db_column='stateId')
    city = models.ForeignKey(City, on_delete=models.SET_NULL, blank=True, null=True, db_column='cityId')
    pincode = models.CharField(max_length=20, db_column='pincode')
    phone = models.CharField(max_length=20, db_column='phone')
    email = models.EmailField(max_length=255, blank=True, null=True, db_column='emailId')
    whatsapp_no = models.CharField(max_length=20, blank=True, null=True, db_column='whatsappNo')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    is_shipping_default = models.BooleanField(default=False, db_column='isShippingDefault')
    is_active = models.BooleanField(default=True, db_index=True, db_column='isActive')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='createdBy', related_name='addr_created', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='updatedBy', related_name='addr_updated')

    class Meta:
        db_table = 'tbl_customer_addr'
        verbose_name_plural = "Customer Addresses"

    def __str__(self):
        return f"{self.customer.name} - {self.address1}"

class CompanyBase(models.Model):
    logo = models.CharField(max_length=255, blank=True, null=True, db_column='logo')
    name = models.CharField(max_length=200, db_column='name')
    short_name = models.CharField(max_length=50, blank=True, null=True, db_column='shortName')
    address1 = models.TextField(blank=True, null=True, db_column='address1')
    address2 = models.TextField(blank=True, null=True, db_column='address2')
    country = models.ForeignKey(Country, on_delete=models.SET_NULL, blank=True, null=True, db_column='countryId')
    state = models.ForeignKey(State, on_delete=models.SET_NULL, blank=True, null=True, db_column='stateId')
    city = models.ForeignKey(City, on_delete=models.SET_NULL, blank=True, null=True, db_column='cityId')
    email_id = models.EmailField(max_length=150, blank=True, null=True, db_column='emailId')
    mobile_no = models.CharField(max_length=20, blank=True, null=True, db_column='mobileNo')
    whatsapp_no = models.CharField(max_length=20, blank=True, null=True, db_column='whatsappNo')
    currency = models.CharField(max_length=20, default='INR', db_column='currency')
    fy_start = models.DateField(blank=True, null=True, db_column='fyStart')
    app_date_format = models.CharField(max_length=50, default='DD-MM-YYYY', db_column='appDateFormat')
    app_color_code = models.CharField(max_length=50, blank=True, null=True, db_column='appColorCode')
    is_active = models.BooleanField(default=True, db_index=True, db_column='isActive')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='createdBy', related_name='%(class)s_created')
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True, db_column='updatedBy', related_name='%(class)s_updated')

    class Meta:
        abstract = True

class Company(CompanyBase):
    branch_limit = models.IntegerField(default=1, db_column='branchLimit')
    user_limit = models.IntegerField(default=5, db_column='userLimit')

    class Meta:
        db_table = 'tbl_company'
        verbose_name_plural = "Companies"

    def __str__(self):
        return self.name

class Branch(CompanyBase):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='branches', db_column='companyId')

    class Meta:
        db_table = 'tbl_branch'
        verbose_name_plural = "Branches"

    def __str__(self):
        return self.name

class Pricelist(models.Model):
    list_name = models.CharField(max_length=150, db_column='listName')
    list_desc = models.TextField(blank=True, null=True, db_column='listDesc')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    is_active = models.IntegerField(default=1, db_column='isActive')
    created_by = models.IntegerField(null=True, blank=True, db_column='createdBy', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.IntegerField(null=True, blank=True, db_column='updatedBy')

    class Meta:
        db_table = 'tbl_pricelist'

    def __str__(self):
        return self.list_name

class PricelistItem(models.Model):
    pricelist = models.ForeignKey(Pricelist, on_delete=models.CASCADE, db_column='pricelistId', related_name='items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, db_column='itemId')
    unit = models.CharField(max_length=50, blank=True, null=True, db_column='unit')
    purchase_rate = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='purchaseRate')
    purchase_rate_inc = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='purchaseRateInc')
    selling_price = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='sellingPrice')
    customer_sp = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='customerSp')
    shown_values = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='shownValues')
    shown_value_disc = models.DecimalField(max_digits=5, decimal_places=2, default=0.00, db_column='shownValueDisc')
    sales_cost = models.DecimalField(max_digits=15, decimal_places=2, default=0.00, db_column='salesCost')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    is_active = models.IntegerField(default=1, db_column='isActive')
    created_by = models.IntegerField(null=True, blank=True, db_column='createdBy', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.IntegerField(null=True, blank=True, db_column='updatedBy')

    class Meta:
        db_table = 'tbl_pricelist_items'

    def __str__(self):
        return f"{self.pricelist.list_name} - {self.product.name}"

class SerialNo(models.Model):
    table_name = models.CharField(max_length=100, db_column='tableName')
    prefix_no = models.CharField(max_length=20, blank=True, null=True, db_column='prefixNo')
    next_no = models.IntegerField(default=1, db_column='nextNo')
    sequence_no = models.IntegerField(default=1, db_column='sequenceNo')
    suffix_no = models.CharField(max_length=20, blank=True, null=True, db_column='suffixNo')
    company_id = models.IntegerField(null=True, blank=True, db_column='companyId', default=settings.COMPANY_ID)
    branch_id = models.IntegerField(null=True, blank=True, db_column='branchId', default=settings.BRANCH_ID)
    is_active = models.BooleanField(default=True, db_column='isActive')
    created_by = models.IntegerField(null=True, blank=True, db_column='createdBy', default=settings.ADMIN_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True, db_column='createdDt')
    updated_at = models.DateTimeField(auto_now=True, db_column='updatedDt')
    updated_by = models.IntegerField(null=True, blank=True, db_column='updatedBy')

    class Meta:
        db_table = 'tbl_serialno'

    def __str__(self):
        return f"{self.table_name} - {self.prefix_no}{self.next_no}"
