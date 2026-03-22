from .base import *

DEBUG = False
ALLOWED_HOSTS = env("ALLOWED_HOSTS")

# Security - Relaxed for Beta/HTTP testing
CSRF_COOKIE_SECURE = False
SESSION_COOKIE_SECURE = False
SECURE_SSL_REDIRECT = False
SECURE_HSTS_SECONDS = 0  # Disable HSTS for HTTP
SECURE_HSTS_INCLUDE_SUBDOMAINS = False
SECURE_HSTS_PRELOAD = False

# Disable strict Cross-Origin Policy for HTTP
SECURE_CROSS_ORIGIN_OPENER_POLICY = None

# Static files storage for production
STATICFILES_STORAGE = "whitenoise.storage.CompressedManifestStaticFilesStorage"
