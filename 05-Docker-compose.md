# Docker-compose

Compose is a tool for defining and running multi-container Docker applications.
With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

## Compose file structure

A Compose file has multiple sections:

**version** is mandatory. (We should use "2" or later; version 1 is deprecated.)

**services** is mandatory. A service is one or more replicas of the same image running as containers.

**networks** is optional and indicates to which networks containers should be connected.
(By default, containers will be connected on a private, per-compose-file network.)

**volumes** is optional and can define volumes to be used and/or shared by the containers.

## Compose commands

### Start

For start our containers

```
docker compose up
```

Another common option is to start containers in the background:

```
docker compose up -d
```

### Build

If your docker compose require build you can use `build` option.
It will execute docker build for all containers mentioning a build path.

```
docker compose build
```

It can also be invoked automatically when starting the application

```
docker compose up --build
```

### Status

```
docker compose ps
```

### Cleaning

```
docker compose kill         # stop containers
docker compose rm           # remove containers
docker compose down         # stop and remove containers
docker compose down -v      # remove everything including volumes
```

### Logs

We can see the log output from services running:

```
docker compose logs
```

If we want to review the logs of a specific service, e.g. web:

```
docker compose logs web
```

# Exercise

Create a compose file for running guestbook app in `05-exercise-docker-compose` folder.

The guestbook app in `05-exercise-docker-compose/guestbook` must be builded by compose and expose port 3000 to your local port 8088.
The app require a redis service named `redis` to work.

<details>
  <summary>💡 Solution</summary>

```yaml
version: "3"

services:
  redis:
    image: redis:alpine

  guestbook:
    build: ./guestbook
    ports:
      - "8088:3000"
    depends_on:
      - redis
```

</details>
