FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=development
ENV FLASK_DEBUG=1
ENV PYTHONUNBUFFERED=1

# Expose the port the app runs on
EXPOSE 5000

# Copy application code
COPY . .

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000", "--reload"]
