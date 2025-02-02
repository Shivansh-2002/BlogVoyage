# Use the official Python image from the Docker Hub
FROM python:3.12-slim

# Set environment variables to avoid Python buffering issues and ensure that Django runs correctly
ENV PYTHONUNBUFFERED 1

# Create and set the working directory in the container
WORKDIR /app

# Install system dependencies (for Django, and for static files, image processing, etc.)
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file to install dependencies
COPY requirements.txt /app/

# Install Python dependencies from the requirements.txt
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the entire project into the container
COPY . /app/

# Make the entrypoint script executable and create the necessary directories
RUN chmod +x /app/entrypoint.sh

# Run collectstatic to gather static files
RUN python manage.py collectstatic --noinput

# Expose port 8000 to make the application accessible
EXPOSE 8000

# Set the default command to run the Django application when the container starts
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
