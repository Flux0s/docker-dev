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

### Running the Application

1. Build and start the containers:

```bash
docker-compose up --build
```

2. Access the application at [http://localhost:5000](http://localhost:5000)

3. To run in detached mode:

```bash
docker-compose up -d
```

4. To stop the application:

```bash
docker-compose down
```

## Development

The application code is mounted as a volume in the Docker container, so any changes you make to the code will be reflected immediately without having to rebuild the container.

## API Endpoints

- `/` - Main page
- `/health` - Health check endpoint (returns JSON)