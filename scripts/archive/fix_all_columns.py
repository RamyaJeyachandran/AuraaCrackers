import os
import django
from django.db import connection

# Set up Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.base')
django.setup()

def fix_schema():
    # Tables and their intended CamelCase columns
    schema_fix = {
        "tbl_category": ["categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_items": ["categoryId", "itemCode", "itemName", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", "mrp", "taxId", "accountId", "minOrdQty", "discountPer", "freeQty", "locationId", "openingQty", "sortNo", "itemImage", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "isDisabled", "updatedBy"],
        "tbl_units": ["convFactor", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_cart": ["userId", "itemId", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_customer": ["contactPerson", "contactPersonNo", "accountId", "taxId", "isOnline", "companyId", "branchId", "websiteId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_customer_addr": ["customerId", "countryId", "stateId", "cityId", "emailId", "whatsappNo", "companyId", "branchId", "isShippingDefault", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_onlinesales_items": ["onlineSalesId", "itemId", "itemName", "itemCode", "rate", "mrp", "qty", "freeQty", "discountPer", "discountAmt", "taxPer", "taxName", "taxAmt", "itemTotal", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_coupons": ["couponName", "couponCode", "couponPer", "companyId", "branchId", "websiteId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_online_sales": ["grandAmt", "companyId", "branchId", "websiteId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_company": ["branchLimit", "userLimit", "shortName", "fyStart", "appDateFormat", "appColorCode", "emailId", "mobileNo", "whatsappNo", "isActive", "createdDt", "updatedDt", "createdBy", "updatedBy", "countryId", "stateId", "cityId"],
        "tbl_branch": ["companyId", "shortName", "fyStart", "appDateFormat", "appColorCode", "emailId", "mobileNo", "whatsappNo", "isActive", "createdDt", "updatedDt", "createdBy", "updatedBy", "countryId", "stateId", "cityId"],
        "tbl_pricelist": ["listName", "listDesc", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_pricelist_items": ["pricelistId", "itemId", "purchaseRate", "purchaseRateInc", "sellingPrice", "customerSp", "shownValues", "shownValueDisc", "salesCost", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_serialno": ["tableName", "prefixNo", "nextNo", "sequenceNo", "suffixNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_country": ["isActive", "createdBy", "createdDt", "updatedDt"],
        "tbl_state": ["countryId", "isActive", "createdBy", "createdDt", "updatedDt"],
        "tbl_city": ["stateId", "isActive", "createdBy", "createdDt", "updatedDt"],
        "tbl_websitelist": ["websiteName", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_users": ["userName", "fullName", "emailId", "mobileNo", "roleId", "onlineCustomerId", "isActive", "lastLogin", "companyId", "branchId", "passwordResetToken", "createdBy", "createdDt", "updatedDt", "updatedBy"],
        "tbl_role": ["companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"]
    }

    try:
        with connection.cursor() as cur:
            for table, columns in schema_fix.items():
                print(f"Checking {table}...")
                
                # Fetch actual current columns in the database
                cur.execute(f"SELECT column_name FROM information_schema.columns WHERE table_name = '{table}'")
                actual_columns = [row[0] for row in cur.fetchall()]
                if not actual_columns: continue
                
                for target_col in columns:
                    # If target column already exists exactly, skip
                    if target_col in actual_columns: continue
                    
                    found_source = None
                    
                    # Case 1: Case-insensitive match (e.g. itemimage -> itemImage)
                    for actual_col in actual_columns:
                        if actual_col.lower() == target_col.lower():
                            found_source = actual_col
                            break
                    
                    # Case 2: Special mapping for 'image' -> 'itemImage' specifically for tbl_items
                    if not found_source and table == "tbl_items" and target_col == "itemImage":
                        if "image" in actual_columns:
                            found_source = "image"
                    
                    # Case 3: Special mapping for 'category' -> 'categoryName'
                    if not found_source and table == "tbl_category" and target_col == "categoryName":
                        if "name" in actual_columns:
                            found_source = "name"
                            
                    # Perform rename if source found
                    if found_source:
                        print(f"  - Renaming {table}.{found_source} to {target_col}")
                        # Check again to avoid double-renaming errors if script is run multiple times
                        cur.execute(f"SELECT count(*) FROM information_schema.columns WHERE table_name = '{table}' AND column_name = '{target_col}'")
                        if cur.fetchone()[0] == 0:
                            cur.execute(f'ALTER TABLE {table} RENAME COLUMN "{found_source}" TO "{target_col}";')

        print("\nSchema fix completed successfully.")
    except Exception as e:
        print(f"Failed to fix schema: {e}")

if __name__ == "__main__":
    fix_schema()
