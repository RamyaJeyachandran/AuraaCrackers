from django.core.management.base import BaseCommand
from apps.crackers.models import Category, Product
import random

class Command(BaseCommand):
    help = 'Seeds the database with initial categories and products'

    def handle(self, *args, **options):
        categories_data = [
            "Single Sound Crackers",
            "Bijili Crackers",
            "Sparklers",
            "Chakkars",
            "Flower Pots",
            "Rockets",
            "Fancy Fountains",
            "Aerial Repeaters",
            "Gift Boxes",
            "Atom Bombs",
        ]

        self.stdout.write("Seeding categories...")
        category_objs = []
        for name in categories_data:
            cat, created = Category.objects.get_or_create(
                name=name,
                defaults={
                    'image': f"https://picsum.photos/seed/{name.replace(' ', '')}/600/600",
                    'description': f"High-quality {name} for celebrations."
                }
            )
            category_objs.append(cat)
            if created:
                self.stdout.write(f"Created category: {name}")

        self.stdout.write("Seeding products...")
        for i in range(1, 501):
            category = category_objs[i % len(category_objs)]
            price = random.randint(50, 2000)
            original_price = int(price * 1.5)
            
            Product.objects.get_or_create(
                name=f"{category.name} - {i}",
                category=category,
                defaults={
                    'code': f"PRD{1000 + i}",
                    'price': price,
                    'original_price': original_price,
                    'image': f"https://picsum.photos/seed/cracker{i}/400/400",
                    'description': f"High-quality {category.name} for a festive celebration. Safe and vibrant.",
                    'content': "Safety instructions included in the pack.",
                    'qty': "1 Box / 10 Pcs",
                    'is_active': True
                }
            )
            if i % 100 == 0:
                self.stdout.write(f"Seeded {i} products...")

        self.stdout.write(self.style.SUCCESS('Successfully seeded database'))
