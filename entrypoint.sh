#!/bin/bash

# Run database migrations (for SQLite, this applies any changes to the db file)
echo "Running migrations..."
python manage.py migrate

# Collect static files (important for production)
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Start the Django development server (or you can use Gunicorn for production)
echo "Starting the application..."
exec "$@"
