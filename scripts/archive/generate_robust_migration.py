import os
import subprocess

def generate_robust_migration():
    # Tables to recreate (structure + data)
    recreate_tables = [
        "tbl_country", "tbl_state", "tbl_city", "tbl_websitelist", 
        "tbl_pricelist", "tbl_pricelist_items", "tbl_serialno"
    ]
    
    # Tables to just sync data (truncate + data)
    sync_data_tables = [
        "tbl_category", "tbl_items", "tbl_units", "tbl_cart", "tbl_customer", 
        "tbl_customer_addr", "tbl_online_sales", "tbl_onlinesales_items", 
        "tbl_coupons", "tbl_users", "tbl_role", "django_migrations", 
        "django_content_type", "auth_group", "auth_permission"
    ]

    # Start the file
    with open("production_migration_robust.sql", "w", encoding="utf-8") as f:
        f.write("-- Robust Sync Script\n")
        f.write("SET session_replication_role = 'replica';\n\n")
        
        # 1. Drop existing 'recreate' tables to avoid conflicts
        for table in recreate_tables:
            f.write(f"DROP TABLE IF EXISTS public.{table} CASCADE;\n")
        f.write("\n")
        
    # 2. Get structure for recreate tables
    table_args = " ".join([f"-t {t}" for t in recreate_tables])
    cmd = f"docker-compose exec -T db pg_dump -U auraauser --schema-only --no-owner --no-privileges {table_args} auraacrackers"
    structure = subprocess.check_output(cmd, shell=True).decode('utf-8', errors='ignore')
    
    # Process structure to be clean
    with open("production_migration_robust.sql", "a", encoding="utf-8") as f:
        f.write(structure)
        f.write("\n")
        
    # 3. Add TRUNCATE for sync tables
    with open("production_migration_robust.sql", "a", encoding="utf-8") as f:
        for table in sync_data_tables:
            f.write(f"TRUNCATE TABLE public.{table} CASCADE;\n")
        f.write("\n")
        
    # 4. Get Data with Column Inserts for ALL tables
    all_tables = recreate_tables + sync_data_tables
    # Batch them to avoid command line length limits
    batch_size = 5
    for i in range(0, len(all_tables), batch_size):
        batch = all_tables[i:i+batch_size]
        table_args = " ".join([f"-t {t}" for t in batch])
        cmd = f"docker-compose exec -T db pg_dump -U auraauser --data-only --column-inserts --no-owner --no-privileges {table_args} auraacrackers"
        data = subprocess.check_output(cmd, shell=True).decode('utf-16le', errors='ignore').encode('utf-8', errors='ignore').decode('utf-8')
        
        # Clean up data (remove set_config and other noise)
        lines = data.split('\n')
        with open("production_migration_robust.sql", "a", encoding="utf-8") as f_out:
            for line in lines:
                if line.startswith("INSERT INTO") or line.startswith("SELECT pg_catalog.setval"):
                    f_out.write(line + "\n")

    # 5. Finish
    with open("production_migration_robust.sql", "a", encoding="utf-8") as f:
        f.write("\nSET session_replication_role = 'origin';\n")
    
    print("Robust migration script generated: production_migration_robust.sql")

if __name__ == "__main__":
    generate_robust_migration()
