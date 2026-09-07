from django.core.management.base import BaseCommand
from django.core.mail import send_mail
from django.conf import settings
import traceback

class Command(BaseCommand):
    help = 'Tests SMTP email sending and outputs detailed diagnostics.'

    def add_arguments(self, parser):
        parser.add_argument(
            '--to',
            type=str,
            help='Recipient email address to test.',
            default=None
        )

    def handle(self, *args, **options):
        to_email = options.get('to')
        if not to_email:
            to_email = getattr(settings, 'EMAIL_HOST_USER', None)

        if not to_email:
            self.stdout.write(self.style.ERROR("Please provide a recipient email using --to email@example.com"))
            return

        self.stdout.write(self.style.NOTICE("--- EMAIL SMTP DIAGNOSTICS ---"))
        self.stdout.write(f"EMAIL_BACKEND: {settings.EMAIL_BACKEND}")
        self.stdout.write(f"EMAIL_HOST: {settings.EMAIL_HOST}")
        self.stdout.write(f"EMAIL_PORT: {settings.EMAIL_PORT}")
        self.stdout.write(f"EMAIL_USE_SSL: {getattr(settings, 'EMAIL_USE_SSL', False)}")
        self.stdout.write(f"EMAIL_USE_TLS: {getattr(settings, 'EMAIL_USE_TLS', False)}")
        self.stdout.write(f"EMAIL_HOST_USER: {settings.EMAIL_HOST_USER or '(Not set)'}")
        self.stdout.write(f"DEFAULT_FROM_EMAIL: {settings.DEFAULT_FROM_EMAIL}")
        self.stdout.write(f"Recipient: {to_email}")
        self.stdout.write("--------------------------------\n")

        if not settings.EMAIL_HOST_USER or not settings.EMAIL_HOST_PASSWORD:
            self.stdout.write(self.style.ERROR("WARNING: EMAIL_HOST_USER or EMAIL_HOST_PASSWORD is not set in environment / .env file!"))

        try:
            self.stdout.write("Attempting to send test email...")
            sent = send_mail(
                subject="Test Email from Auraa Crackers Server",
                message="This is a test email sent from manage.py test_email command to verify SMTP connection.",
                from_email=settings.DEFAULT_FROM_EMAIL,
                recipient_list=[to_email],
                fail_silently=False,
            )
            if sent:
                self.stdout.write(self.style.SUCCESS(f"SUCCESS: Test email sent to {to_email} successfully!"))
            else:
                self.stdout.write(self.style.ERROR("FAILED: send_mail returned 0 (no email sent)."))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f"ERROR: SMTP Email sending failed: {str(e)}"))
            self.stdout.write(self.style.ERROR(traceback.format_exc()))
