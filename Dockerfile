# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Install gunicorn
RUN pip install gunicorn

ENV PATH="$PATH:/usr/local/bin"

# Expose port 80 for Gunicorn
EXPOSE 80

# Define environment variable
ENV DJANGO_SETTINGS_MODULE=SamEcommerce.settings

# Start Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:80", "SamEcommerce.wsgi:application"]
