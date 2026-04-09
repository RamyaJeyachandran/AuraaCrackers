import os
import django
from django.db import connection

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.base')

# Manually override DATABASES to connect to the docker-exposed port
from django.conf import settings
if not settings.configured:
    django.setup()

# We need to change the DB host and port before django.setup() or right after if we use connection override
from django.db import connections
settings.DATABASES['default']['HOST'] = 'localhost'
settings.DATABASES['default']['PORT'] = '5433'

def list_all_tables_and_columns():
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT table_name, column_name 
            FROM information_schema.columns 
            WHERE table_schema = 'public'
            AND table_name LIKE 'tbl_%'
            ORDER BY table_name, ordinal_position
        """)
        results = cursor.fetchall()
        
        current_table = None
        for table, column in results:
            if table != current_table:
                print(f"Table: {table}")
                current_table = table
            print(f"  - {column}")

if __name__ == "__main__":
    list_all_tables_and_columns()
