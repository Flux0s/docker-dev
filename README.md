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

The application can run in either development or production mode using the same Docker configuration with different environment variables.

1. Copy the example environment file:

```bash
cp .env.example .env
```

2. Edit the `.env` file to set your desired environment variables.

### Running the Application

#### Development Mode (Default)

```bash
# Start in development mode (default)
docker-compose up --build
```

#### Production Mode

```bash
# Start in production mode
FLASK_ENV=production FLASK_DEBUG=0 FLASK_MOUNT=ro RESTART_POLICY=always docker-compose up --build -d
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
| Web Server | Flask Development Server | Gunicorn |
| Debug Mode | Enabled | Disabled |
| Hot Reloading | Enabled | Disabled |
| Volume Mounts | Read-Write | Read-Only |
| Container Restart | No | Always |

## API Endpoints

- `/` - Main page
- `/health` - Health check endpoint (returns JSON)