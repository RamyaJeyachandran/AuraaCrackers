import os
from django.core.management.base import BaseCommand
from apify_client import ApifyClient
from apps.crackers.models import Testimonial
from django.conf import settings

class Command(BaseCommand):
    help = 'Fetch reviews from Google Maps using Apify'

    def handle(self, *args, **options):
        # Use best practices for API token handling
        apify_token = os.environ.get('APIFY_TOKEN')
        if not apify_token:
            self.stderr.write(self.style.ERROR("APIFY_TOKEN not found in environment variables. Please add it to your .env file."))
            return

        client = ApifyClient(apify_token)

        # Requirements: Use the Apify actor: compass/google-maps-reviews-scraper
        run_input = {
            "startUrls": [
                {
                    "url": "https://www.google.com/maps/place/Auraa+Crackers+Sivakasi/@9.3992778,77.7821944,17z/data=!3m1!4b1!4m6!3m5!1s0x3b06c9aa9b9f4741:0xd082609f94bf72c!8m2!3d9.3992778!4d77.7821944!16s%2Fg%2F11l36k70mx"
                }
            ],
            "maxReviews": 50,
            "reviewsSort": "newest"
        }

        self.stdout.write("Starting Apify actor: compass/google-maps-reviews-scraper...")
        try:
            # Run the actor and wait for it to finish
            run = client.actor("compass/google-maps-reviews-scraper").call(run_input=run_input)

            self.stdout.write(f"Actor run finished. Dataset ID: {run['defaultDatasetId']}")
            self.stdout.write("Fetching results from dataset and filtering (rating >= 4)...")
            
            reviews_count = 0
            # Iterate through the results in the dataset
            for item in client.dataset(run["defaultDatasetId"]).iterate_items():
                # Extract fields as per requirements
                rating = item.get("stars") or item.get("rating")
                
                # Filter: return only reviews where rating >= 4
                if rating and rating >= 4:
                    name = item.get("name") or "Anonymous Reviewer"
                    text = item.get("text") or ""
                    profile_image = item.get("reviewerPhotoUrl")
                    # Handle missing text or images safely
                    if not profile_image:
                        # Fallback to a default avatar if missing
                        profile_image = f"https://api.dicebear.com/7.x/initials/svg?seed={name}"
                    
                    review_date = item.get("publishedAtDate") or item.get("relativeTime") or "Recent"
                    
                    # Update or create testimonial in database
                    Testimonial.objects.update_or_create(
                        name=name,
                        text=text,
                        defaults={
                            'profile_image': profile_image,
                            'rating': int(rating),
                            'review_date': str(review_date),
                        }
                    )
                    reviews_count += 1

            self.stdout.write(self.style.SUCCESS(f"Successfully processed {reviews_count} reviews with rating 4 or above."))
            
            # Clear testimonials cache to show new data immediately
            from django.core.cache import cache
            cache.delete('testimonials_data_fragment')
            self.stdout.write("Testimonials cache cleared.")
            
        except Exception as e:
            self.stderr.write(self.style.ERROR(f"An error occurred: {str(e)}"))
