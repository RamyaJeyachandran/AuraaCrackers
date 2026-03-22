from django.conf import settings

def website_id_processor(request):
    """
    Exposes WEBSITE_ID globally in all template contexts.
    Prioritizes session value if available.
    """
    if hasattr(request, 'session'):
        website_id = request.session.get('website_id', getattr(settings, 'WEBSITE_ID', 2))
    else:
        website_id = getattr(settings, 'WEBSITE_ID', 2)
        
    return {
        'WEBSITE_ID': website_id
    }
