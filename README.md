# Docker Development Environment

A simple Flask application running in a Docker container to demonstrate using Docker for development environments.

## Project Structure

```
docker-dev/
├── app.py              # Main Flask application
├── templates/          # HTML templates
│   └── index.html      # Main page template
├── requirements.txt    # Python dependencies
├── Dockerfile          # Docker configuration
└── docker-compose.yml  # Docker Compose configuration
```

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Environment Setup

The application can run in either development or production mode using a single environment variable `APP_ENV` which selects the appropriate target in our multi-stage Dockerfile.

1. Copy the example environment file:

```bash
cp .env.example .env
```

2. Edit the `.env` file to set your desired environment.

### Running the Application

#### Production Mode (Default)

```bash
# Start in production mode (default)
docker-compose up --build -d
```

#### Development Mode

```bash
# Start in development mode
APP_ENV=development docker-compose up --build
```

### Stopping the Application

```bash
docker-compose down
```

## Development

The application code is mounted as a volume in the Docker container when running in development mode, so any changes you make to the code will be reflected immediately without having to rebuild the container.

### Key Differences Between Environments

| Feature | Development | Production |
|---------|-------------|------------|
| Docker Stage | development | production |
| Web Server | Flask Development Server | Gunicorn |
| Debug Mode | Enabled | Disabled |
| Hot Reloading | Enabled | Disabled |
| Container Restart | On-failure | On-failure |

## API Endpoints

- `/` - Main page
- `/health` - Health check endpoint (returns JSON)