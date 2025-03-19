#!/bin/bash
set -e

# Check if we're in development or production mode
if [ "$FLASK_ENV" = "development" ]; then
    echo "Starting Flask app in DEVELOPMENT mode..."
    exec flask run --host=0.0.0.0 --port=5000 --reload
else
    echo "Starting Flask app in PRODUCTION mode..."
    # Use Gunicorn with 4 worker processes in production
    exec gunicorn --bind 0.0.0.0:5000 app:app --workers 4 --access-logfile -
fi
