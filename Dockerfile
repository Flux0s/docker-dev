FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=app.py
# Default to development, can be overridden at runtime
ENV FLASK_ENV=development
ENV FLASK_DEBUG=1

# Copy application code
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Use an entrypoint script to determine how to run the app
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
