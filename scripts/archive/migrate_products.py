import re
import psycopg2
import os

# Database connection details
DB_NAME = "auraacrackers"
DB_USER = "auraauser"
DB_PASS = "auraapass"
DB_HOST = "db" # In Docker network
DB_PORT = "5432"

def migrate():
    conn = psycopg2.connect(
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASS,
        host=DB_HOST,
        port=DB_PORT
    )
    cur = conn.cursor()

    with open('products.sql', 'r', encoding='utf-8') as f:
        content = f.read()

    # 1. Migrate Categories
    print("Migrating categories...")
    cat_matches = re.finditer(r"INSERT INTO `category`.*?VALUES\s*(.*?);", content, re.DOTALL)
    for match in cat_matches:
        values_str = match.group(1)
        rows = re.findall(r"\((.*?)\)(?:,|$)", values_str, re.DOTALL)
        for row in rows:
            # Use regex to split by comma but ignore commas inside quotes
            parts = re.findall(r"'[^']*'|[^,]+", row)
            parts = [p.strip().strip("'") for p in parts]
            if len(parts) >= 4:
                try:
                    cur.execute("""
                        INSERT INTO tbl_category (id, categoryName, categoryImage, isActive, companyId, branchId, createdBy)
                        VALUES (%s, %s, %s, %s, 1, 1, 1)
                        ON CONFLICT (id) DO NOTHING
                    """, (parts[0], parts[1], parts[2], True if parts[3] == '1' else False))
                except Exception as e:
                    print(f"Error inserting category row {row}: {e}")
            else:
                print(f"Skipping malformed category row: {row}")

    # 2. Migrate Products (Items)
    print("Migrating items...")
    item_matches = re.finditer(r"INSERT INTO `product`.*?VALUES\s*(.*?);", content, re.DOTALL)
    for match in item_matches:
        values_str = match.group(1)
        rows = re.findall(r"\((.*?)\)(?:,|$)", values_str, re.DOTALL)
        for row in rows:
            parts = re.findall(r"'[^']*'|[^,]+", row)
            parts = [p.strip().strip("'") for p in parts]
            
            # parts mapping (14 fields in MySQL product table):
            # 0: id, 1: productName, 2: categoryId, 3: productCode, 4: quantity, 
            # 5: productImg, 6: content, 7: actualPrice, 8: price, 9: isActive, 
            # 10: isNotDeleted, 11: mapProductId, 12: SKU, 13: outBookItemId
            
            if len(parts) >= 10:
                try:
                    cur.execute("""
                        INSERT INTO tbl_items (
                            id, categoryId, itemCode, itemName, itemImage, itemType, 
                            openingQty, purchaseRate, saleRate, mrp, isActive, 
                            companyId, branchId, createdBy, isSales
                        ) VALUES (%s, %s, %s, %s, %s, 'G', %s, %s, %s, %s, %s, 1, 1, 1, 1)
                        ON CONFLICT (id) DO NOTHING
                    """, (
                        parts[0], parts[2], parts[3], parts[1], parts[5], 
                        parts[4], parts[7], parts[8], parts[7], 
                        True if parts[9] == '1' else False
                    ))
                except Exception as e:
                    print(f"Error inserting item row {row}: {e}")
            else:
                print(f"Skipping malformed item row: {row}")


    conn.commit()
    cur.close()
    conn.close()
    print("Migration finished.")

if __name__ == "__main__":
    migrate()
