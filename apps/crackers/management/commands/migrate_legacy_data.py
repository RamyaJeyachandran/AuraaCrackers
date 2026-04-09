import os
import re
import decimal
from django.core.management.base import BaseCommand
from django.db import transaction, connection
from django.conf import settings
from apps.crackers.models import Category, Unit, Product, Customer, CustomerAddress, OnlineSales, OnlineSalesItem, State
from apps.users.models import User, Role, UserAddress

class Command(BaseCommand):
    help = 'Comprehensive migration of legacy MySQL data to production PostgreSQL'

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Starting migration..."))
        
        # Define migration tasks in orders of dependency
        tasks = [
            {
                "name": "Categories",
                "table": "tbl_category",
                "file": "backups/migrate_categories_fixed.sql",
                "model": Category,
                "mapping": {"categoryName": "name", "categoryImage": "image", "sortNo": "order"}
            },
            {
                "name": "Units",
                "table": "tbl_units",
                "file": "backups/product.sql", # Checking multiple files if needed
                "model": Unit,
                "mapping": {"unitName": "name", "unitCode": "code"}
            },
            {
                "name": "Products",
                "table": "tbl_items",
                "file": "backups/product.sql",
                "model": Product,
                "mapping": {
                    "productName": "name", "categoryId": "category_id", 
                    "productCode": "code", "price": "price", 
                    "actualPrice": "actual_price", "productImg": "image"
                }
            },
            {
                "name": "Customers",
                "table": "tbl_customer",
                "file": "backups/customerList.sql",
                "model": Customer,
                "mapping": {"customerName": "name", "mobileNo": "phone_number", "emailId": "email"}
            },
            {
                "name": "Customer Addresses",
                "table": "tbl_customer_addr",
                "file": "backups/customerList.sql",
                "model": CustomerAddress,
                "mapping": {"customerId": "customer_id", "address": "address", "city": "city", "pincode": "pincode", "stateId": "state_id"}
            },
            {
                "name": "Users",
                "table": "tbl_users",
                "file": "backups/users_migration.sql",
                "model": User,
                "mapping": {"userName": "username", "fullName": "full_name", "mobileNo": "phone_number", "emailId": "email", "roleId": "role_id"}
            },
            {
                "name": "User Addresses",
                "table": "tbl_users_addr",
                "file": "backups/auraacrackers_backup.sql",
                "model": UserAddress,
                "mapping": {"userid": "user_id", "address": "address", "city": "city", "pincode": "pincode", "stateid": "state_id"}
            },
            {
                "name": "Online Sales",
                "table": "tbl_online_sales",
                "file": "backups/migrate_sales.sql",
                "model": OnlineSales,
                "mapping": {"customerId": "customer_id", "orderNo": "order_number", "totalAmount": "total_amount", "orderDate": "created_at"}
            },
            {
                "name": "Online Sales Items",
                "table": "tbl_onlinesales_items",
                "file": "backups/orderproduct.sql",
                "model": OnlineSalesItem,
                "mapping": {"onlineSalesId": "sales_id", "productId": "product_id", "quantity": "quantity", "price": "price"}
            }
        ]

        for task in tasks:
            self.stdout.write(f"--- Migrating {task['name']} ---")
            try:
                count = self.process_task(task)
                self.stdout.write(self.style.SUCCESS(f"Successfully migrated {count} records for {task['name']}"))
            except Exception as e:
                self.stdout.write(self.style.WARNING(f"Warning during {task['name']} migration: {str(e)}"))

    def process_task(self, task):
        file_path = task['file']
        if not os.path.exists(file_path):
            # Try alternate file
            alt_files = ["backups/auraacrackers_backup.sql", "backups/auraacrackers_structure.sql", "backups/product.sql", "backups/users_migration.sql", "backups/customerList.sql"]
            found = False
            for f_alt in alt_files:
                if os.path.exists(f_alt):
                    for enc_alt in ['utf-8', 'utf-16', 'latin-1']:
                        try:
                            with open(f_alt, 'r', encoding=enc_alt, errors='ignore') as check_file:
                                if task['table'] in check_file.read(100000):
                                    file_path = f_alt
                                    found = True
                                    break
                        except:
                            continue
                if found: break
            if not found:
                raise FileNotFoundError(f"Source file for {task['table']} not found.")

        # Load content with correct encoding
        content = None
        for enc in ['utf-8', 'utf-16', 'latin-1']:
            try:
                with open(file_path, 'r', encoding=enc) as f:
                    content = f.read()
                    if task['table'] in content:
                        self.stdout.write(f"Loaded {file_path} using {enc}")
                        break
            except:
                continue
        
        if not content:
            # Fallback to errors='ignore'
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()

        # Regex to find INSERT statements for the specific table
        table_pattern = re.escape(task['table'])
        pattern = rf"INSERT INTO\s+(?:`|public\.)?{table_pattern}(?:`| )?\s*\((.*?)\)\s*VALUES\s*(.*?)(?:ON CONFLICT|;)"
        matches = list(re.finditer(pattern, content, re.IGNORECASE | re.DOTALL))
        
        # Also check for COPY statements (PostgreSQL dump format)
        copy_pattern = rf"COPY\s+(?:public\.)?{table_pattern}\s*\((.*?)\)\s*FROM\s+stdin;([\s\S]*?)^\\\."
        copy_matches = list(re.finditer(copy_pattern, content, re.IGNORECASE | re.MULTILINE))
        
        if table_pattern == 'tbl_users_addr':
            self.stdout.write(f"DEBUG: table_pattern={table_pattern}, len(content)={len(content)}")
            # Try a simpler match for debug
            test_match = re.search(rf"COPY\s+(?:public\.)?{table_pattern}", content, re.IGNORECASE)
            self.stdout.write(f"DEBUG: Simple search for COPY {table_pattern}: {'Found' if test_match else 'Not Found'}")
            if test_match:
                self.stdout.write(f"DEBUG: match_start={test_match.start()}")
                self.stdout.write(f"DEBUG: Context: {content[test_match.start():test_match.start()+200]}")
        
        self.stdout.write(f"Found {len(matches)} INSERT statements and {len(copy_matches)} COPY blocks for {task['name']}")

        total_migrated = 0
        
        with transaction.atomic():
            # Process INSERTs
            for match in matches:
                columns_str = match.group(1).replace('`', '').replace('"', '').replace(' ', '')
                columns = columns_str.split(',')
                values_part = match.group(2)
                value_rows = re.findall(r"\((.*?)\)(?:,|$)", values_part, re.DOTALL)
                for row_str in value_rows:
                    total_migrated += self.save_row(task, columns, row_str, total_migrated, is_copy=False)

            # Process COPYs
            for match in copy_matches:
                columns_str = match.group(1).replace('`', '').replace('"', '').replace(' ', '')
                columns = columns_str.split(',')
                data_part = match.group(2).strip()
                lines = data_part.split('\n')
                for line in lines:
                    if line.strip():
                        total_migrated += self.save_row(task, columns, line, total_migrated, is_copy=True)
                        
        return total_migrated

    def save_row(self, task, columns, row_data, current_total, is_copy=False):
        if is_copy:
            row_values = row_data.split('\t')
        else:
            # Simple parse for row_str
            row_values = []
            current_val = []
            in_quotes = False
            quote_char = None
            for char in row_data:
                if char in ("'", '"'):
                    if not in_quotes:
                        in_quotes = True
                        quote_char = char
                    elif char == quote_char:
                        in_quotes = False
                        quote_char = None
                    current_val.append(char)
                elif char == ',' and not in_quotes:
                    row_values.append("".join(current_val).strip())
                    current_val = []
                else:
                    current_val.append(char)
            row_values.append("".join(current_val).strip())

        if len(row_values) != len(columns):
            return 0

        row_dict = dict(zip(columns, row_values))
        model_data = {}
        
        for mysql_col, dj_field in task['mapping'].items():
            if mysql_col in row_dict:
                val = row_dict[mysql_col]
                if val.lower() == 'null' or val == '\\N':
                    val = None
                elif not is_copy and ((val.startswith("'") and val.endswith("'")) or (val.startswith('"') and val.endswith('"'))):
                    val = val[1:-1].replace("''", "'")
                model_data[dj_field] = val

        processed_data = {}
        for field, val in model_data.items():
            if field.endswith('_id') and val is not None:
                try:
                    processed_data[field] = int(val)
                except ValueError:
                    processed_data[field] = val
            else:
                processed_data[field] = val

        if hasattr(task['model'], 'company_id'):
            processed_data['company_id'] = getattr(settings, 'COMPANY_ID', 1)
        if hasattr(task['model'], 'branch_id'):
            processed_data['branch_id'] = getattr(settings, 'BRANCH_ID', 1)

        obj_id = None
        id_col = 'id' if 'id' in row_dict else None
        if id_col and row_dict[id_col]:
            try:
                obj_id = int(row_dict[id_col].strip("'").strip('"'))
            except: pass

        try:
            if obj_id:
                task['model'].objects.update_or_create(id=obj_id, defaults=processed_data)
            else:
                task['model'].objects.create(**processed_data)
            if (current_total + 1) % 500 == 0:
                self.stdout.write(f"Processed {current_total + 1} for {task['name']}...")
            return 1
        except Exception as e:
            # self.stdout.write(f"Error saving row: {str(e)}")
            return 0
