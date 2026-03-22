import os
import re
from django.core.management.base import BaseCommand
from apps.crackers.models import Category, Product, Unit
from django.db import transaction

class Command(BaseCommand):
    help = 'Imports data from products.sql into Category and Product models'

    def handle(self, *args, **options):
        sql_path = 'products.sql'
        if not os.path.exists(sql_path):
            self.stdout.write(self.style.ERROR(f'File {sql_path} not found'))
            return

        with open(sql_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Regular expressions for INSERT statements
        category_matches = re.findall(r"INSERT INTO `category` [^;]*? VALUES\s*(.*?);", content, re.DOTALL)
        product_matches = re.findall(r"INSERT INTO `product` [^;]*? VALUES\s*(.*?);", content, re.DOTALL)

        def split_sql_values(values_str):
            """Splits a SQL VALUES string like '(1,2),(3,4)' into list of strings ['1,2', '3,4']"""
            records = []
            current = []
            depth = 0
            in_string = False
            for i, char in enumerate(values_str):
                if char == "'" and (i == 0 or values_str[i-1] != "\\"):
                    in_string = not in_string
                
                if not in_string:
                    if char == "(":
                        depth += 1
                        if depth == 1:
                            current = []
                            continue
                    elif char == ")":
                        depth -= 1
                        if depth == 0:
                            records.append("".join(current))
                            continue
                
                if depth > 0:
                    current.append(char)
            return records

        def split_fields(record_str):
            """Splits a record string '1, 'Name', 3' into fields correctly handling commas in quotes"""
            parts = re.findall(r"'(?:[^']|'')*'|[^,]+", record_str)
            return [p.strip().strip("'").replace("''", "'") for p in parts]

        with transaction.atomic():
            # Process Categories
            self.stdout.write('Importing categories...')
            for match in category_matches:
                records = split_sql_values(match)
                for val_str in records:
                    parts = split_fields(val_str)
                    if len(parts) < 4:
                        continue
                    cat_id = int(parts[0])
                    name = parts[1]
                    img = parts[2]
                    is_active = int(parts[3]) == 1
                    
                    Category.objects.update_or_create(
                        id=cat_id,
                        defaults={
                            'name': name,
                            'image': img if img else None,
                            'is_active': is_active
                        }
                    )

            # Ensure a default Unit exists for products
            unit, _ = Unit.objects.get_or_create(name='Box', defaults={'code': 'BOX'})

            # Process Products
            self.stdout.write('Importing products...')
            for match in product_matches:
                records = split_sql_values(match)
                for val_str in records:
                    parts = split_fields(val_str)
                    
                    if len(parts) < 14:
                        continue
                        
                    prod_id = int(parts[0])
                    name = parts[1]
                    cat_id = int(parts[2])
                    code = parts[3]
                    # qty_str = parts[4]
                    img = parts[5]
                    content_str = parts[6]
                    actual_price = float(parts[7]) if parts[7] else 0.0
                    price = float(parts[8]) if parts[8] else 0.0
                    is_active = int(parts[9]) == 1
                    # is_deleted = int(parts[10]) == 0
                    sku = parts[12]
                    outbook_id = int(parts[13])

                    try:
                        category = Category.objects.get(id=cat_id)
                        Product.objects.update_or_create(
                            id=prod_id,
                            defaults={
                                'name': name,
                                'category': category,
                                'code': code,
                                'unit': unit,
                                'price': price,
                                'original_price': actual_price,
                                'image': img if img else None,
                                'content': content_str,
                                'is_active': is_active,
                                'sku': sku,
                                'outbook_item_id': outbook_id
                            }
                        )
                    except Category.DoesNotExist:
                        self.stdout.write(self.style.WARNING(f'Category {cat_id} not found for product {prod_id}'))

        self.stdout.write(self.style.SUCCESS('Data import completed successfully'))
