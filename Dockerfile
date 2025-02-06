# Use official Python image as base
FROM python:3.12.6

# Set working directory inside the container
WORKDIR /app

# Copy project files into the container's /app directory
COPY . /app/

# Install dependencies from requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Collect static files (optional but recommended for production)
RUN python manage.py collectstatic --noinput

# Expose port 8000 for the Django app
EXPOSE 8000

# Command to start the Django app (using Gunicorn for production)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "project2.wsgi:application"]
