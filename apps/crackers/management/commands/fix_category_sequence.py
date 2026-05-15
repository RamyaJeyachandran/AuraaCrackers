from django.core.management.base import BaseCommand
from django.db import connection

class Command(BaseCommand):
    help = 'Resets database sequences for the tbl_category table'

    def handle(self, *args, **options):
        with connection.cursor() as cursor:
            # Get all tables in public schema
            cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';")
            tables = [row[0] for row in cursor.fetchall()]
            
            for table in tables:
                try:
                    # Check if 'id' column exists
                    cursor.execute(f"SELECT column_name FROM information_schema.columns WHERE table_name = '{table}' AND column_name = 'id';")
                    if cursor.fetchone():
                        self.stdout.write(f"Resetting sequence for {table}...")
                        cursor.execute(f"SELECT setval(pg_get_serial_sequence('{table}', 'id'), coalesce(max(id), 0) + 1, false) FROM {table};")
                except Exception as e:
                    self.stdout.write(self.style.WARNING(f"Skipping {table}: {str(e)}"))
                    continue
            
            self.stdout.write(self.style.SUCCESS('Successfully reset all sequences'))
