import os
import django
from django.db import connection

# Set up Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.base')
django.setup()

def escape_val(val, colname):
    if val is None:
        return "NULL"
    
    # Force boolean columns to true/false
    boolean_cols = ["isSales", "isActive", "isDisabled", "isOnline", "isShippingDefault"]
    if colname in boolean_cols:
        if isinstance(val, bool):
            return "true" if val else "false"
        if str(val) == "1": return "true"
        if str(val) == "0": return "false"
        return "true" if val else "false"

    if isinstance(val, str):
        # Escape single quotes
        return "'" + val.replace("'", "''") + "'"
    
    # For dates, timestamps, etc.
    if hasattr(val, 'isoformat'):
        return f"'{val.isoformat()}'"
        
    if isinstance(val, bool):
        return "true" if val else "false"
    
    return str(val)

def generate_tbl_items_sql():
    table = "tbl_items"

    try:
        with connection.cursor() as cur:
            with open("tbl_items_migration.sql", "w", encoding="utf-8") as f:
                f.write("-- tbl_items Data Migration Script (Forced Booleans)\n")
                f.write("SET session_replication_role = 'replica';\n\n")
                
                f.write(f"TRUNCATE TABLE public.{table} CASCADE;\n\n")
                
                # Fetch data
                cur.execute(f'SELECT * FROM public."{table}"')
                colnames = [desc[0] for desc in cur.description]
                rows = cur.fetchall()
                
                print(f"Exporting {len(rows)} records from {table} using Django connection...")
                
                col_str = ", ".join([f'"{c}"' for c in colnames])
                for row in rows:
                    vals = []
                    for i in range(len(row)):
                        vals.append(escape_val(row[i], colnames[i]))
                    
                    f.write(f"INSERT INTO public.{table} ({col_str}) VALUES ({', '.join(vals)});\n")
                
                # Reset sequence for Identity column
                f.write(f"\n-- Reset Identity Sequence\n")
                f.write(f"SELECT setval(pg_get_serial_sequence('public.{table}', 'id'), coalesce(max(id), 1), false) FROM public.{table};\n")

                f.write("\nSET session_replication_role = 'origin';\n")
        
        print("Done: tbl_items_migration.sql")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    generate_tbl_items_sql()
