import os
import django
from django.conf import settings

# Set up Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.base')
django.setup()

from apps.crackers.models import Product

def map_images():
    # Base directory for product images
    static_products_dir = os.path.join(settings.BASE_DIR, 'static', 'images', 'products')
    
    # Get all products
    products = Product.objects.all()
    count = 0
    missing_files = []
    
    print(f"Starting mapping for {products.count()} products...")
    
    for product in products:
        original_image = product.image
        if not original_image:
            product.image = '/static/images/products/noimage.jpg'
            product.save()
            continue
            
        # Extract filename if it's a full URL
        if 'http' in original_image:
            filename = original_image.split('/')[-1]
        else:
            filename = original_image.replace('/static/images/products/', '')

        # Check if the file exists in the static directory
        file_path = os.path.join(static_products_dir, filename)
        
        if os.path.exists(file_path):
            new_path = f"/static/images/products/{filename}"
            if product.image != new_path:
                product.image = new_path
                product.save()
                count += 1
        else:
            # If specifically not home banner or logo, mark as missing
            if not filename.startswith('home_banner') and not filename.startswith('list_logo'):
                missing_files.append(filename)
            
            # Default to noimage.jpg if missing
            product.image = '/static/images/products/noimage.jpg'
            product.save()

    print(f"Successfully updated {count} products.")
    if missing_files:
        print(f"Warning: {len(set(missing_files))} unique image files were missing in {static_products_dir}")
        # print some examples
        # print(list(set(missing_files))[:5])

if __name__ == "__main__":
    map_images()
