import os
import django
import sys

# Add project root to sys.path
sys.path.append('d:/AuraaZenAIProject/auraaCrakersProject')

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
django.setup()

from apps.crackers.models import Product, Category

def check_counts():
    total = Product.objects.count()
    active_products = Product.objects.filter(is_active=True).count()
    active_categories = Category.objects.filter(is_active=True)
    products_in_active_cats = Product.objects.filter(is_active=True, category__in=active_categories).count()
    
    print(f"Total Products in DB: {total}")
    print(f"Active Products (is_active=True): {active_products}")
    print(f"Active Categories count: {active_categories.count()}")
    print(f"Active Products in Active Categories: {products_in_active_cats}")
    
    # Check for any uncategorized but active products
    uncategorized_active = Product.objects.filter(is_active=True, category__isnull=True).count()
    print(f"Uncategorized Active Products: {uncategorized_active}")

if __name__ == "__main__":
    check_counts()
