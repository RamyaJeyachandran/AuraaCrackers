import psycopg2
from psycopg2 import sql
import datetime

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

def generate_tbl_items_sql():
    conn_params = "postgresql://auraauser:auraapass@localhost:5433/auraacrackers"
    table = "tbl_items"

    try:
        conn = psycopg2.connect(conn_params)
        cur = conn.cursor()
        
        with open("tbl_items_migration.sql", "w", encoding="utf-8") as f:
            f.write("-- tbl_items Data Migration Script\n")
            f.write("SET session_replication_role = 'replica';\n\n")
            
            f.write(f"TRUNCATE TABLE public.{table} CASCADE;\n\n")
            
            cur.execute(sql.SQL("SELECT * FROM {}").format(sql.Identifier(table)))
            colnames = [desc[0] for desc in cur.description]
            rows = cur.fetchall()
            
            print(f"Exporting {len(rows)} records from {table}...")
            
            col_str = ", ".join([f'"{c}"' for c in colnames])
            for row in rows:
                vals = ", ".join([escape_val(v) for v in row])
                f.write(f"INSERT INTO public.{table} ({col_str}) VALUES ({vals});\n")
            
            # Reset sequence
            cur.execute(f"SELECT pg_get_serial_sequence('public.{table}', 'id')")
            seq_res = cur.fetchone()
            if seq_res and seq_res[0]:
                f.write(f"\nSELECT pg_catalog.setval('{seq_res[0]}', (SELECT MAX(id) FROM public.{table}), true);\n")

            f.write("\nSET session_replication_role = 'origin';\n")
        
        conn.close()
        print("Done: tbl_items_migration.sql")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    generate_tbl_items_sql()
