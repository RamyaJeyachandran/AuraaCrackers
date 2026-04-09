import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.development')
django.setup()

from apps.crackers.models import Company, Branch, Product, Category, Unit, Customer, Coupon

def seed_data():
    print("--- Seeding Company & Branch Data ---")
    
    # Create Company
    company, created = Company.objects.get_or_create(
        name='Auraa Enterprises',
        defaults={
            'short_name': 'AuraaEnt',
            'is_active': True,
            'currency': 'INR'
        }
    )
    if created:
        print(f"Created Company: {company.name} (ID: {company.id})")
    else:
        print(f"Company '{company.name}' already exists (ID: {company.id})")

    # Create Branch
    branch, created = Branch.objects.get_or_create(
        name='Auraa Crackers',
        company=company,
        defaults={
            'short_name': 'AuraaCrk',
            'is_active': True
        }
    )
    if created:
        print(f"Created Branch: {branch.name} (ID: {branch.id})")
    else:
        print(f"Branch '{branch.name}' already exists (ID: {branch.id})")

    print("\n--- Updating Existing Records with Company/Branch IDs ---")
    
    # Update all products (tbl_items)
    updated_products = Product.objects.all().update(company_id=company.id, branch_id=branch.id)
    print(f"Updated {updated_products} Products")

    # Update all categories (tbl_category)
    updated_categories = Category.objects.all().update(company_id=company.id, branch_id=branch.id)
    print(f"Updated {updated_categories} Categories")

    # Update all units (tbl_units)
    updated_units = Unit.objects.all().update(company_id=company.id, branch_id=branch.id)
    print(f"Updated {updated_units} Units")

    # Update all customers (tbl_customer)
    updated_customers = Customer.objects.all().update(company_id=company.id)
    print(f"Updated {updated_customers} Customers")

    # Update all coupons (tbl_coupons)
    updated_coupons = Coupon.objects.all().update(company_id=company.id)
    print(f"Updated {updated_coupons} Coupons")
    
    print("\n--- Seeding Complete ---")

if __name__ == "__main__":
    seed_data()
