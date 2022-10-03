# Docker

```bash
## List Docker CLI commands
docker
docker container --help

## Display Docker version and info
docker --version
docker version
docker info

## Execute Docker image
docker run hello-world

## List Docker images
docker image ls

## List Docker containers (running, all, all in quiet mode)
docker container ls
docker container ls --all
docker container ls -aq

# Create image using this directory's Dockerfile
docker build -t friendlyhello .

# Run "friendlyname" mapping port 4000 to 80
docker run -p 4000:80 friendlyhello

# Same thing, but in detached mode
docker run -d -p 4000:80 friendlyhello

# List all running containers
docker container ls

# List all containers, even those not running
docker container ls -a

# Gracefully stop the specified container
docker container stop <hash>

# Force shutdown of the specified container
docker container kill <hash>

# Remove specified container from this machine
docker container rm <hash>

# Remove all containers
docker container rm $(docker container ls -a -q)

# List all images on this machine
docker image ls -a

# Remove specified image from this machine
docker image rm <image id>

# Remove all images from this machine
docker image rm $(docker image ls -a -q)

# Log in this CLI session using your Docker credentials
docker login

# Tag <image> for upload to registry
docker tag <image> username/repository:tag

# Upload tagged image to registry
docker push username/repository:tag

# Run image from a registry
docker run username/repository:tag

# Inspect task or container
docker inspect <task or container>

# List container IDs
docker container ls -q
```

---

# Docker Compose

```bash
# Builds, (re)creates, starts, and attaches to containers for a service.
docker compose up
    -d, --detach                # Detached mode: Run containers in the background
    --build                     # Build images before starting containers.


# Stops containers and removes containers, networks, volumes, and images created by up.
docker compose down
    --volumes                   # Remove named volumes declared in the volumes section of the Compose file and anonymous volumes attached to containers.
    --remove-orphans            # Remove containers for services not defined in the Compose file.

# Build or rebuild services
docker compose build

# Lists containers.
docker compose ls

# Starts existing containers for a service.
docker compose start [SERVICE  NAME]

# Stops running containers without removing them.
docker compose stop [SERVICE  NAME]


docker compose logs [SERVICE  NAME]
    -f, --follow             # Follow log output.
```

# Docker-compose file

## Defining Dependencies

You **MUST** use a wait wrapper to ensure the readiness of the dependency.
Otherwise the webapp container would start once the DB container is running,
and not when the DB port is reachable.

```yml
services:
webapp:
    depends_on:
    - db
    command: ["./wait-for-it.sh", "db:5432", "--", "start_webapp"]
    [...]
db:
    [...]
```

## Custom Build Context

```yml
services:
webapp:
  build:
  context: ./webapp
  dockerfile: Dockerfile.webapp
  args:
    buildno: 1
```

### Ports

```yml
ports:
  - "3000"
  - "8000:80" # guest:host
# expose ports to linked services (not to host)
expose: ["3000"]
```

### Commands

```yml
# command to execute
command: bundle exec thin -p 3000
command: [bundle, exec, thin, -p, 3000]

# override the entrypoint
entrypoint: /app/start.sh
entrypoint: [php, -d, vendor/bin/phpunit]
```

### Environment variables

```yml
# environment vars
environment:
  RACK_ENV: development
environment:
  - RACK_ENV=development

# environment vars from file
env_file: .env
env_file: [.env, .development.env]
```

### Dependencies

```yml
# makes the `db` service available as the hostname `database`
# (implies depends_on)
links:
  - db:database
  - redis

# make sure `db` is alive before starting
depends_on:
  - db
```

## Custom Build Context

```yml
services:
  webapp:
    build:
      context: ./webapp
      dockerfile: Dockerfile.webapp
      args:
        buildno: 1
```

## Health Checking

```yml
services:
  webapp:
    [...]
    healthcheck:
      test: >
        curl --noproxy "*" -v -f -s http://127.0.0.1:8080/webapp
      interval: 15s
      timeout: 5s
      retries: 20
      start_period: 30s
```

## Restarting Services

Old style:

```yml
services:
  webapp:
    restart: <no|always|on-failure|unless-stopped>
```

new style:

```yml
services:
webapp:
  [...]
  deploy:
  restart_policy:
    condition: on-failure
    delay: 5s
    max_attempts: 3
    window: 120s
```

## Advanced features

### Labels

```yml
services:
  web:
    labels:
      com.example.description: "Accounting web app"
```

### DNS servers

Custom DNS servers. Can be a single value or a list.
Custom DNS search domains. Can be a single value or a list.

```yml
services:
  web:
    dns_search: example.com
    dns: 8.8.8.8
    dns:
      - 8.8.8.8
      - 8.8.4.4
```

### External links

Link to containers started outside this docker-compose.yml

```yml
services:
  web:
    external_links:
      - redis_1
      - project_db_1:mysql
```

### Hosts

```yml
services:
  web:
    extra_hosts:
      - "somehost:192.168.1.100"
```

### Network

```yml
# creates a custom network called `frontend`
networks:
  frontend:
```

### External network

```yml
# join a preexisting network
networks:
  default:
    external:
      name: frontend
```
