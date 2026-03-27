import os
import django
from django.db import connection

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
django.setup()

def check_columns(table_name):
    with connection.cursor() as cursor:
        cursor.execute(f"""
            SELECT column_name 
            FROM information_schema.columns 
            WHERE table_name = '{table_name}'
        """)
        columns = [row[0] for row in cursor.fetchall()]
        print(f"Columns for {table_name}: {columns}")

if __name__ == "__main__":
    check_columns('tbl_category')
    check_columns('tbl_items')
    check_columns('tbl_online_sales')
