from apps.crackers.models import Product
from django.db.models import Min, Max, Count
categories = Product.objects.values('category__name').annotate(min_sort=Min('sort_no'), max_sort=Max('sort_no'), count=Count('id')).order_by('min_sort')
for c in categories:
    print(f"Category: {c['category__name']}, Count: {c['count']}, Sort Range: {c['min_sort']} - {c['max_sort']}")
