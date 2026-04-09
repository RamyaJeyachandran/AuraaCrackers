import re

# Mapping for units from tbl_units
unit_mapping = {
    '1 Box': 1,
    'Bag': 2,
    'Box': 3,
    'Pcs': 4,
    'Pkt': 5,
    '1 Pkt': 5, 
    '1 Pcs': 4,
    'PCS': 4,
    'Box ': 3,
    'BOX': 3,
    'PKT': 5,
    'PCS ': 4,
    'Box': 3,
}

def extract_tuples(content):
    """
    Robustly extract (v1, v2, ...) tuples from MySQL VALUES block.
    Finds the VALUES keyword and manually parses the tuples.
    """
    # Find the start of the VALUES block
    # Case insensitive because it could be VALUES or values
    values_match = re.search(r'VALUES', content, re.IGNORECASE)
    if not values_match:
        return []
    
    val_str = content[values_match.end():]
    
    tuples = []
    current = []
    in_quotes = False
    quote_char = None
    paren_depth = 0
    
    i = 0
    while i < len(val_str):
        char = val_str[i]
        
        # Handle escape characters
        if char == '\\' and i + 1 < len(val_str):
            if paren_depth > 0:
                current.append(char)
                current.append(val_str[i+1])
            i += 2
            continue

        # Handle quotes
        if (char == "'" or char == '"'):
            if not in_quotes:
                in_quotes = True
                quote_char = char
            elif char == quote_char:
                in_quotes = False
                quote_char = None
        
        if not in_quotes:
            if char == '(':
                paren_depth += 1
                if paren_depth == 1:
                    current = [] # Start a new tuple
                    i += 1
                    continue
            elif char == ')':
                paren_depth -= 1
                if paren_depth == 0:
                    tuples.append("".join(current).strip())
                    current = []
                    i += 1
                    continue
            elif char == ';':
                # End of the statement
                break
        
        if paren_depth > 0:
            current.append(char)
        i += 1
    return tuples

def migrate():
    input_file = 'product.sql'
    output_file = 'migrate_items.sql'
    
    print(f"Reading {input_file}...")
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()

    all_values = extract_tuples(content)

    print(f"Found {len(all_values)} rows to migrate.")
    
    pg_inserts = []
    for val_str in all_values:
        # Split but respect commas in quotes
        parts = []
        current = []
        in_quotes = False
        quote_char = None
        
        i = 0
        while i < len(val_str):
            char = val_str[i]
            if (char == "'" or char == '"') and (i == 0 or val_str[i-1] != '\\'):
                if not in_quotes:
                    in_quotes = True
                    quote_char = char
                elif char == quote_char:
                    in_quotes = False
                    quote_char = None
            
            if char == ',' and not in_quotes:
                parts.append("".join(current).strip())
                current = []
            else:
                current.append(char)
            i += 1
        parts.append("".join(current).strip())

        if len(parts) < 13: # We need at least index 12 for SKU
            if len(parts) < 11:
                continue
            m_sku = parts[3] # Fallback to productCode if SKU missing
        else:
            m_sku = parts[12]

        m_id = parts[0]
        m_name = parts[1] 
        m_catid = parts[2]
        m_qty = parts[4]
        m_img = parts[5]
        m_unit_name = parts[6].strip("'").strip('"').strip()
        m_actual_price = parts[7]
        m_price = parts[8]
        m_is_active = parts[9]
        m_is_not_deleted = parts[10]

        # PostgreSQL Mappings
        pg_id = m_id
        pg_itemName = m_name
        pg_categoryId = m_catid
        
        # itemCode -> SKU
        # sortNo -> SKU (numeric or fallback to id)
        pg_itemCode = m_sku 
        
        clean_sku = m_sku.strip("'").strip('"')
        try:
            # Try to convert SKU to integer for sortNo
            # Extract digits only if SKU has some
            numeric_part = re.sub("[^0-9]", "", clean_sku)
            if numeric_part:
                pg_sortNo = numeric_part
            else:
                pg_sortNo = m_id
        except:
            pg_sortNo = m_id

        pg_openingQty = m_qty
        pg_itemImage = m_img
        
        # Unit ID lookup
        pg_unitId = str(unit_mapping.get(m_unit_name, 3)) # Default to 3 (Box)
        
        pg_purchaseRate = m_actual_price
        pg_saleRate = m_price
        
        # isDisabled: 1 - MySQL.isActive
        try:
            val = int(m_is_active)
            pg_isDisabled = str(1 - val)
        except:
            pg_isDisabled = '0'

        # isActive: bool based on isNotDeleted
        pg_isActive = 'true' if m_is_not_deleted == '1' else 'false'
        
        pg_itemType = "'G'"
        pg_isSales = '1'
        pg_companyId = '1'
        pg_branchId = '1'

        pg_row = f"({pg_id}, {pg_categoryId}, {pg_itemCode}, {pg_itemName}, {pg_itemImage}, {pg_itemType}, {pg_unitId}, {pg_isSales}, {pg_saleRate}, {pg_purchaseRate}, {pg_openingQty}, {pg_sortNo}, {pg_isDisabled}, {pg_companyId}, {pg_branchId}, {pg_isActive})"
        pg_inserts.append(pg_row)

    columns = [
        "id", "\"categoryId\"", "\"itemCode\"", "\"itemName\"", "\"itemImage\"", 
        "\"itemType\"", "\"unitId\"", "\"isSales\"", "\"saleRate\"", "\"purchaseRate\"", 
        "\"openingQty\"", "\"sortNo\"", "\"isDisabled\"", "\"companyId\"", 
        "\"branchId\"", "\"isActive\""
    ]
    
    sql = f"INSERT INTO public.tbl_items ({', '.join(columns)}) VALUES\n"
    sql += ",\n".join(pg_inserts)
    sql += ";\n"
    
    # Also add sequence update
    sql += "\nSELECT setval('tbl_items_id_seq', (SELECT MAX(id) FROM tbl_items));"

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(sql)
    
    print(f"Successfully generated {output_file}")

if __name__ == "__main__":
    migrate()
