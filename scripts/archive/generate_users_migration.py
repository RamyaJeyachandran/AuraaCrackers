import re
import traceback

def parse_and_extract_records(content):
    records = []
    # Find all VALUES blocks
    insert_pattern = re.compile(r"INSERT INTO `users` \([^)]+\) VALUES\s*(.*?);", re.DOTALL)
    val_blocks = insert_pattern.findall(content)
    
    for block in val_blocks:
        # State machine to split by ), (
        in_string = False
        string_char = ""
        paren_count = 0
        current_str = ""
        
        i = 0
        while i < len(block):
            char = block[i]
            
            if char in ["'", "`"] and (i == 0 or block[i-1] != '\\'):
                if not in_string:
                    in_string = True
                    string_char = char
                elif string_char == char:
                    # Check for escaped quote in MySQL ('') or (\')
                    if i + 1 < len(block) and block[i+1] == char:
                        current_str += char + char
                        i += 2
                        continue
                    in_string = False
            
            if not in_string:
                if char == '(':
                    paren_count += 1
                elif char == ')':
                    paren_count -= 1
                    if paren_count == 0:
                        # Extract content INSIDE parentheses
                        records.append(current_str[1:].strip()) # Skip the starting '('
                        current_str = ""
                        # Skip until next (
                        i += 1
                        while i < len(block) and block[i] != '(':
                            i += 1
                        continue
            
            if paren_count > 0 or in_string:
                current_str += char
            i += 1
            
    return records

def split_csv_line(line):
    # Splits a line by comma but respects quotes
    parts = []
    current_part = ""
    in_string = False
    string_char = ""
    
    i = 0
    while i < len(line):
        char = line[i]
        
        if char in ["'", "`"] and (i == 0 or line[i-1] != '\\'):
            if not in_string:
                in_string = True
                string_char = char
            elif string_char == char:
                # Check for escaped quote in MySQL ('') or (\')
                if i + 1 < len(line) and line[i+1] == char:
                    current_part += char + char
                    i += 2
                    continue
                in_string = False
        
        if char == ',' and not in_string:
            parts.append(current_part.strip())
            current_part = ""
        else:
            current_part += char
        i += 1
    
    parts.append(current_part.strip())
    return parts

def clean_val(val):
    if not val: return None
    val = val.strip()
    if val.startswith("'") and val.endswith("'"):
        # Remove quotes and unescape
        val = val[1:-1].replace("''", "'").replace("\\'", "'")
        return val
    if val.lower() == 'null':
        return None
    return val

def generate_postgres_sql(mysql_records, customer_ids):
    postgres_queries = []
    postgres_queries.append("-- Migration from users.sql to tbl_users")
    postgres_queries.append("INSERT INTO public.tbl_users ")
    postgres_queries.append('    ("userName", "fullName", "mobileNo", "emailId", "password", "onlineCustomerId", "isActive", "roleId", "companyId", "branchId", "createdBy", "createdDt", "updatedDt")')
    postgres_queries.append("VALUES")
    
    records_to_insert = []
    seen_usernames = set()
    seen_phones = set()
    
    for rec in mysql_records:
        parts = split_csv_line(rec)
        
        # MySQL schema: id, name, password, email, mobileNo, address, state, city, pincode, usertype, isActive, outBookUserId
        if len(parts) < 11:
            continue
            
        m_id = clean_val(parts[0])
        m_name = clean_val(parts[1])
        m_pass = clean_val(parts[2])
        m_email = clean_val(parts[3])
        m_phone = clean_val(parts[4])
        m_isActive = clean_val(parts[10])
        
        if not m_name: continue
        
        # Mapping rules
        safe_name = m_name.replace("'", "''")
        username = safe_name if safe_name not in seen_usernames else f"{safe_name}_{m_id}"
        seen_usernames.add(username)
        
        fullname = safe_name
        
        if m_email and m_email.strip():
            safe_email = m_email.replace("'", "''")
            email_val = f"'{safe_email}'"
        else:
            email_val = "NULL"
        
        # phone
        phone = m_phone.strip() if m_phone else "0"
        if phone in seen_phones:
            phone = f"{phone}_{m_id}"
        seen_phones.add(phone)
        
        is_active = 'true' if str(m_isActive) == '1' else 'false'
        
        # onlineCustomerId -> only if it's in customer_ids
        customer_id_val = m_id if int(m_id) in customer_ids else "NULL"
        
        # password
        pwd = m_pass.replace("'", "''") if m_pass else ""
        
        records_to_insert.append(
            f"    ('{username}', '{fullname}', '{phone}', {email_val}, '{pwd}', {customer_id_val}, {is_active}, 3, 1, 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
        )
    
    postgres_queries.append(",\n".join(records_to_insert) + ";")
    
    return "\n".join(postgres_queries)

def main():
    try:
        # Load customer IDs
        customer_ids = set()
        # Try different encodings
        content_found = False
        for enc in ['utf-16', 'utf-8', 'utf-16-le', 'utf-16-be']:
            try:
                with open('customer_ids.txt', 'r', encoding=enc) as f:
                    lines = f.readlines()
                    for line in lines:
                        line = line.strip()
                        if line.isdigit():
                            customer_ids.add(int(line))
                if customer_ids:
                    print(f"Loaded {len(customer_ids)} customer IDs with {enc} encoding.")
                    content_found = True
                    break
            except Exception:
                continue
                
        if not content_found:
            print("Warning: No customer IDs loaded.")

        with open('users.sql', 'r', encoding='utf-8') as f:
            content = f.read()
            
        records = parse_and_extract_records(content)
        pg_sql = generate_postgres_sql(records, customer_ids)
        
        with open('users_migration.sql', 'w', encoding='utf-8') as f:
            f.write(pg_sql)
            
        print(f"Successfully generated users_migration.sql with {len(records)} records.")
    except Exception as e:
        traceback.print_exc()
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
