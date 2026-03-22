from .base import *

DEBUG = True
ALLOWED_HOSTS = ["*"]

# In development, we can use console email backend
EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"

# CORS
CORS_ALLOW_ALL_ORIGINS = True
