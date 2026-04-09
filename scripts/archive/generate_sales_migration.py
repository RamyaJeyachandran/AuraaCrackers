import re
import os
import sys

def parse_sql_values(line):
    # Matches INSERT INTO table VALUES(...) or just (...)
    match = re.search(r'VALUES\s*\((.*)\);', line, re.IGNORECASE)
    if not match:
        return None
    content = match.group(1)
    
    values = []
    current = ""
    in_string = False
    escaped = False
    
    for char in content:
        if char == "'" and not escaped:
            in_string = not in_string
            current += char
        elif char == "\\" and not escaped:
            escaped = True
            current += char
        elif char == "," and not in_string:
            values.append(current.strip())
            current = ""
        else:
            escaped = False
            current += char
    values.append(current.strip())
    return values

def main():
    # 1. Fetch mapping from DB
    import subprocess
    cmd = 'docker exec -i auraacrakersproject-web-1 python manage.py shell -c "from apps.users.models import User; from apps.crackers.models import CustomerAddress; print({u.phone_number: (u.online_customer_id, CustomerAddress.objects.filter(customer_id=u.online_customer_id).first().id if u.online_customer_id and CustomerAddress.objects.filter(customer_id=u.online_customer_id).exists() else None) for u in User.objects.all() if u.phone_number})"'
    result = subprocess.check_output(cmd, shell=True).decode()
    # Find the dict in output
    dict_match = re.search(r'({.*})', result)
    if not dict_match:
        print("Failed to fetch mapping from DB")
        return
    user_mapping = eval(dict_match.group(1))
    
    # 2. Parse orders.sql
    sales_inserts = []
    with open('orders.sql', 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            if not line.startswith('INSERT INTO'): continue
            vals = parse_sql_values(line)
            if not vals: continue
            
            # Mapping based on observation:
            # 0: id, 1: orderNo, 2: userId, 3: netTotal, 4: promotionCode, 5: discount, 6: roundamt?, ... 18: mobileNo
            # Wait, let's re-verify indices
            # INSERT INTO o1 VALUES(2, 2024080001, 7, 5859, '', 0, 175.77, 0, 6035, 'Destination reached', 'Ordered', NULL, 1, '2024-08-17 07:22:23', 0, 0, 0, 7, 8072280373);
            # indices: 0:id, 1:orderNo, 2:userId, 3:netTotal, 4:promoCode, 5:discount, 6:packing?, 7:unknown, 8:grandTotal, ... 13:createdDate, ... 18:mobileNo
            
            oid = vals[0]
            orderNo = vals[1]
            netTotal = vals[3]
            promoCode = vals[4]
            discount = vals[5]
            grandTotal = vals[8]
            status = vals[10]
            isActive = vals[12]
            createdDate = vals[13]
            mobileNo = vals[18].strip("'")
            
            mapping = user_mapping.get(mobileNo)
            customerid = mapping[0] if mapping else 'NULL'
            customeraddrid = mapping[1] if mapping and mapping[1] else 'NULL'
            
            # id, customerid, customeraddrid, "websiteId", transno, transdt, status, discountcode, discount, totalamt, roundamt, "grandAmt", "companyId", "branchId", "isActive", "createdBy"
            query = f"INSERT INTO tbl_online_sales (id, customerid, customeraddrid, \"websiteId\", transno, transdt, status, discountcode, discount, totalamt, roundamt, \"grandAmt\", \"companyId\", \"branchId\", \"isActive\", \"createdBy\") VALUES ({oid}, {customerid}, {customeraddrid}, 1, {orderNo}, {createdDate}, {status}, {promoCode}, {discount}, {netTotal}, 0.00, {grandTotal}, 1, 1, {'TRUE' if isActive=='1' else 'FALSE'}, 1);"
            sales_inserts.append(query)

    # 3. Parse orderproduct.sql
    item_inserts = []
    with open('orderproduct.sql', 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            if not line.startswith('INSERT INTO'): continue
            vals = parse_sql_values(line)
            if not vals: continue
            
            # Mapping based on observation:
            # indices: 0:id, 1:orderId, 2:productId, 3:quantity, 4:actualPrice, 5:price, 6:isActive, 7:branchId, 8:companyId, 9:productName, 10:SKU
            
            iid = vals[0]
            onlineSalesId = vals[1]
            itemId = vals[2]
            qty = vals[3]
            mrp = vals[4]
            rate = vals[5]
            isActive = vals[6]
            itemName = vals[9]
            itemCode = vals[10]
            
            # Calculate itemTotal
            try:
                q = float(qty)
                r = float(rate)
                itemTotal = q * r
            except:
                itemTotal = 0.00
                
            # id, "onlineSalesId", "itemId", "itemName", "itemCode", rate, mrp, qty, "itemTotal", "companyId", "branchId", "isActive", "createdBy"
            query = f"INSERT INTO tbl_onlinesales_items (id, \"onlineSalesId\", \"itemId\", \"itemName\", \"itemCode\", rate, mrp, qty, \"itemTotal\", \"companyId\", \"branchId\", \"isActive\", \"createdBy\") VALUES ({iid}, {onlineSalesId}, {itemId}, {itemName}, {itemCode}, {rate}, {mrp}, {qty}, {itemTotal}, 1, 1, {'TRUE' if isActive=='1' else 'FALSE'}, 1);"
            item_inserts.append(query)

    # 4. Write to file
    with open('migrate_sales.sql', 'w', encoding='utf-8') as f:
        f.write("-- Disable triggers\nSET session_replication_role = 'replica';\n\n")
        f.write("-- tbl_online_sales\n")
        f.write("DELETE FROM tbl_online_sales;\n")
        for q in sales_inserts:
            f.write(q + "\n")
        f.write("\n-- tbl_onlinesales_items\n")
        f.write("DELETE FROM tbl_onlinesales_items;\n")
        for q in item_inserts:
            f.write(q + "\n")
        f.write("\n-- Re-enable triggers\nSET session_replication_role = 'origin';\n")
        f.write("\n-- Sync sequences\n")
        f.write("SELECT setval('tbl_online_sales_id_seq', (SELECT MAX(id) FROM tbl_online_sales));\n")
        f.write("SELECT setval('tbl_onlinesales_items_id_seq', (SELECT MAX(id) FROM tbl_onlinesales_items));\n")

    print(f"Generated migrate_sales.sql with {len(sales_inserts)} sales and {len(item_inserts)} items.")

if __name__ == "__main__":
    main()
