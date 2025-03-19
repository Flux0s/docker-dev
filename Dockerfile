FROM python:3.11-slim AS base

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set common environment variables
ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=app.py

# Copy application code
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Development stage
FROM base AS development
ENV APP_ENV=development
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000", "--debug", "--reload"]

# Production stage
FROM base AS production
ENV APP_ENV=production
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app", "--workers", "4", "--access-logfile", "-"]
