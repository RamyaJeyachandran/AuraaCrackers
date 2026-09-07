from django.core.management.base import BaseCommand
from django.db import transaction
from django.db.models import Count
from apps.crackers.models import OnlineSales
from apps.crackers.services import OrderService

class Command(BaseCommand):
    help = 'Identifies duplicate order numbers (trans_no) and re-assigns unique sequential order numbers.'

    def add_arguments(self, parser):
        parser.add_argument(
            '--dry-run',
            action='store_true',
            help='Report duplicate orders without committing changes to the database.',
        )

    def handle(self, *args, **options):
        dry_run = options.get('dry_run', False)
        
        if dry_run:
            self.stdout.write(self.style.WARNING("--- RUNNING IN DRY-RUN MODE (No database changes will be saved) ---"))
        
        # Find all trans_no values that appear more than once
        duplicates_query = OnlineSales.objects.values('trans_no').annotate(
            cnt=Count('id')
        ).filter(cnt__gt=1).order_by('trans_no')
        
        duplicate_trans_nos = [item['trans_no'] for item in duplicates_query if item['trans_no']]
        
        if not duplicate_trans_nos:
            self.stdout.write(self.style.SUCCESS("No duplicate order numbers found in database!"))
            return

        self.stdout.write(self.style.WARNING(f"Found {len(duplicate_trans_nos)} duplicate order number group(s). Processing..."))

        total_fixed = 0

        with transaction.atomic():
            for trans_no in duplicate_trans_nos:
                orders = list(OnlineSales.objects.filter(trans_no=trans_no).order_by('id'))
                # Keep the first (earliest) order as is
                original_order = orders[0]
                self.stdout.write(
                    f"\nGroup trans_no: {trans_no} (Total: {len(orders)} orders)"
                )
                self.stdout.write(
                    f"  [KEEP ORIGINAL] ID: {original_order.id} | Customer: {original_order.customer.name} | Date: {original_order.created_at}"
                )

                # Fix all subsequent duplicates
                for dup_order in orders[1:]:
                    new_trans_no = OrderService.generate_next_trans_no()
                    old_trans_no = dup_order.trans_no

                    self.stdout.write(
                        self.style.SUCCESS(
                            f"  [FIX] ID: {dup_order.id} | Customer: {dup_order.customer.name} | "
                            f"Renumbering: {old_trans_no} -> {new_trans_no}"
                        )
                    )

                    if not dry_run:
                        dup_order.trans_no = new_trans_no
                        dup_order.save(update_fields=['trans_no'])

                    total_fixed += 1

            if dry_run:
                transaction.set_rollback(True)
                self.stdout.write(
                    self.style.SUCCESS(
                        f"\n[DRY-RUN COMPLETE] Identified {total_fixed} duplicate order record(s) that would be re-numbered."
                    )
                )
                self.stdout.write(
                    "To apply these changes on your database, run:\n"
                    "  python manage.py fix_duplicate_orders"
                )
            else:
                self.stdout.write(
                    self.style.SUCCESS(
                        f"\n[SUCCESS] Successfully re-numbered {total_fixed} duplicate order record(s)."
                    )
                )
