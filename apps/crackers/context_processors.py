from django.conf import settings
from .models import Category

def website_id_processor(request):
    """
    Exposes WEBSITE_ID and footer_categories globally in all template contexts.
    """
    if hasattr(request, 'session'):
        website_id = request.session.get('website_id', getattr(settings, 'WEBSITE_ID', 2))
    else:
        website_id = getattr(settings, 'WEBSITE_ID', 2)
        
    # Fetch active categories for the footer collections
    footer_categories = Category.objects.filter(is_active=True).order_by('order')
        
    return {
        'WEBSITE_ID': website_id,
        'footer_categories': footer_categories
    }
