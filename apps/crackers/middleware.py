from django.conf import settings

class WebsiteMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Only proceed if sessions are enabled
        if hasattr(request, 'session'):
            if 'website_id' not in request.session:
                request.session['website_id'] = getattr(settings, 'WEBSITE_ID', 2)
            
            # Attach to request object for easy view/model use
            request.website_id = request.session['website_id']
        else:
            request.website_id = getattr(settings, 'WEBSITE_ID', 2)
        
        response = self.get_response(request)
        return response
