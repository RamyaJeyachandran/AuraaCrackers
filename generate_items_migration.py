import psycopg2
from psycopg2 import sql
import datetime

def escape_val(val, type_code):
    if val is None:
        return "NULL"
    
    # 16 is the OID for boolean in Postgres
    if type_code == 16:
        if isinstance(val, bool):
            return "true" if val else "false"
        if str(val) == "1": return "true"
        if str(val) == "0": return "false"
        return "true" if val else "false"

    if isinstance(val, (datetime.datetime, datetime.date)):
        return f"'{val.isoformat()}'"
    if isinstance(val, str):
        return "'" + val.replace("'", "''") + "'"
    if isinstance(val, bool):
        return "true" if val else "false"
    
    return str(val)

def generate_tbl_items_sql():
    conn_params = "postgresql://auraauser:auraapass@localhost:5433/auraacrackers"
    table = "tbl_items"

    try:
        conn = psycopg2.connect(conn_params)
        cur = conn.cursor()
        
        with open("tbl_items_migration.sql", "w", encoding="utf-8") as f:
            f.write("-- tbl_items Data Migration Script (Fixed Booleans)\n")
            f.write("SET session_replication_role = 'replica';\n\n")
            
            f.write(f"TRUNCATE TABLE public.{table} CASCADE;\n\n")
            
            cur.execute(sql.SQL("SELECT * FROM {}").format(sql.Identifier(table)))
            colnames = [desc[0] for desc in cur.description]
            type_codes = [desc[1] for desc in cur.description]
            rows = cur.fetchall()
            
            print(f"Exporting {len(rows)} records from {table}...")
            
            col_str = ", ".join([f'"{c}"' for c in colnames])
            for row in rows:
                vals = []
                for i in range(len(row)):
                    vals.append(escape_val(row[i], type_codes[i]))
                
                f.write(f"INSERT INTO public.{table} ({col_str}) VALUES ({', '.join(vals)});\n")
            
            # Reset sequence for Identity column
            f.write(f"\n-- Reset Identity Sequence\n")
            f.write(f"SELECT setval(pg_get_serial_sequence('public.{table}', 'id'), coalesce(max(id), 1), false) FROM public.{table};\n")

            f.write("\nSET session_replication_role = 'origin';\n")
        
        conn.close()
        print("Done: tbl_items_migration.sql")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    generate_tbl_items_sql()
