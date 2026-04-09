import psycopg2
from psycopg2 import sql
import datetime
import json
import subprocess

def escape_val(val):
    if val is None:
        return "NULL"
    if isinstance(val, (datetime.datetime, datetime.date)):
        return f"'{val.isoformat()}'"
    if isinstance(val, str):
        return "'" + val.replace("'", "''") + "'"
    if isinstance(val, bool):
        return "true" if val else "false"
    return str(val)

def generate_sql():
    conn_params = "postgresql://auraauser:auraapass@localhost:5433/auraacrackers"
    tables = [
        "tbl_category", "tbl_items", "tbl_units", "tbl_cart", "tbl_customer", 
        "tbl_customer_addr", "tbl_online_sales", "tbl_onlinesales_items", 
        "tbl_coupons", "tbl_users", "tbl_role", "django_migrations", 
        "django_content_type", "auth_group", "auth_permission"
    ]
    
    recreate_tables = [
        "tbl_country", "tbl_state", "tbl_city", "tbl_websitelist", 
        "tbl_pricelist", "tbl_pricelist_items", "tbl_serialno"
    ]

    try:
        conn = psycopg2.connect(conn_params)
        cur = conn.cursor()
        
        with open("sync_production_clean.sql", "w", encoding="utf-8") as f:
            f.write("-- Clean Sync Script for Hostinger VPS\n")
            f.write("SET session_replication_role = 'replica';\n\n")
            
            # 1. Structure for Recreate Tables
            # I'll use pg_dump just for structure as it's usually less problematic
            f.write("-- Recreating missing tables structure\n")
            f.close()
            
        subprocess_cmd = f"docker-compose exec -T db pg_dump -U auraauser --schema-only --no-owner --no-privileges " + " ".join([f"-t {t}" for t in recreate_tables]) + " auraacrackers"
        import subprocess
        structure = subprocess.check_output(subprocess_cmd, shell=True).decode('utf-8', errors='ignore')
        
        with open("sync_production_clean.sql", "a", encoding="utf-8") as f:
            # Clean structure output from restricted headers if any
            clean_struct = []
            for line in structure.split('\n'):
                if not line.startswith('\\restrict') and not line.startswith('\\unrestrict'):
                    clean_struct.append(line)
            f.write('\n'.join(clean_struct))
            f.write("\n\n-- Truncating existing tables\n")
            for table in tables:
                f.write(f"TRUNCATE TABLE public.{table} CASCADE;\n")
            
            f.write("\n-- Inserting Data\n")
            
            for table in recreate_tables + tables:
                print(f"Processing {table}...")
                cur.execute(sql.SQL("SELECT * FROM {}").format(sql.Identifier(table)))
                colnames = [desc[0] for desc in cur.description]
                rows = cur.fetchall()
                if not rows: continue
                
                f.write(f"\n-- Data for {table}\n")
                col_str = ", ".join([f'"{c}"' for c in colnames])
                for row in rows:
                    vals = ", ".join([escape_val(v) for v in row])
                    f.write(f"INSERT INTO public.{table} ({col_str}) VALUES ({vals});\n")
                
                # Reset sequence
                cur.execute(f"SELECT pg_get_serial_sequence('public.{table}', 'id')")
                seq = cur.fetchone()[0]
                if seq:
                    f.write(f"SELECT pg_catalog.setval('{seq}', (SELECT MAX(id) FROM public.{table}), true);\n")

            f.write("\nSET session_replication_role = 'origin';\n")
        
        conn.close()
        print("Done: sync_production_clean.sql")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    generate_sql()
