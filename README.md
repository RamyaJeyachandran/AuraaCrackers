# Auraa Crackers Project

This project is a Django-based application for managing Auraa Crackers operations. It includes features for user management, crackers inventory, and core functionalities, supported by Celery for background tasks and Redis for caching and message brokerage.

## Prerequisites

- **Docker & Docker Compose** (Recommended)
- **Python 3.10+** (For local setup)
- **PostgreSQL** (For local setup)
- **Redis** (For local setup)

## Getting Started

### 1. Environment Configuration

Before running the project, you need to set up the environment variables.

1.  Copy the example environment file:
    ```bash
    cp .env.example .env
    ```
2.  Open the `.env` file and update the values as needed (especially `SECRET_KEY`, `DB_PASSWORD`, etc.).

### 2. Running with Docker (Recommended)

The easiest way to run the project is using Docker Compose.

1.  **Build and start the services:**
    ```bash
    docker-compose up --build
    ```
    This will start the following services:
    - `db`: PostgreSQL database.
    - `redis`: Redis server.
    - `web`: Django application (accessible at `http://localhost:8000`).
    - `celery_worker`: Background task worker.
    - `celery_beat`: Periodic task scheduler.
    - `flower`: Celery monitoring tool (accessible at `http://localhost:5555`).
    - `nginx`: Reverse proxy (accessible at `http://localhost:80`).

2.  **Run migrations:**
    ```bash
    docker-compose exec web python manage.py migrate
    ```

3.  **Create a superuser:**
    ```bash
    docker-compose exec web python manage.py createsuperuser
    ```

### 3. Running Locally (Non-Docker)

If you prefer to run the project without Docker, follow these steps:

1.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

2.  **Set up the database:**
    Ensure you have a PostgreSQL database created and the details are correctly configured in your `.env` file.

3.  **Run migrations:**
    ```bash
    python manage.py migrate
    ```

4.  **Start the development server:**
    ```bash
    python manage.py runserver
    ```

5.  **Start Celery Worker (Optional):**
    ```bash
    celery -A config worker --loglevel=info
    ```

6.  **Start Celery Beat (Optional):**
    ```bash
    celery -A config beat --loglevel=info
    ```

## Useful Commands

- **Stop Docker containers:** `docker-compose down`
- **View logs:** `docker-compose logs -f [service_name]`
- **Run tests:** `python manage.py test`

## Project Structure

- `apps/`: Contains Django applications (`core`, `crackers`, `users`).
- `config/`: Main project configuration (settings, URLs, WSGI, ASGI, Celery).
- `static/`: Static assets (CSS, JS, images).
- `templates/`: HTML templates.
- `nginx/`: Nginx configuration.
