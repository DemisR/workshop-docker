---
marp: true
---

# Docker-compose

Compose is a tool for defining and running multi-container Docker applications.

With Compose, you use a YAML file to configure your application's services.

Then, with a single command, you create and start all the services from your configuration.

---

This is how you work with Compose:

- You describe a set (or stack) of containers in a YAML file called `docker-compose.yml`.

- You run `docker-compose up`.

- Compose automatically pulls images, builds containers, and starts them.

- Compose can set up links, volumes, and other Docker options for you.

- Compose can run the containers in the background, or in the foreground.

- When containers are running in the foreground, their aggregated output is shown.

---

## The `docker-compose.yml` file

```yaml
version: "3.8"

services:
  web:
    build: ./04-example
    ports:
      - "4000:80"

  redis:
    image: redis:alpine
```

---

## Compose file structure

A Compose file has multiple sections:

**version** is mandatory. (We should use "2" or later; version 1 is deprecated.)

**services** are mandatory. A service is one or more replicas of the same image running as containers.

**networks** are optional and indicate to which networks containers should be connected.
(By default, containers will be connected on a private, per-compose-file network.)

**volumes** are optional and can define volumes to be used and/or shared by the containers.

---

## Compose commands

### Start

To start our containers

```
docker compose up
```

Another common option is to start containers in the background:

```
docker compose up -d
```

---

### Build

If you would like to build services containers you can use `build` option.

```
docker compose build
```

It can also be invoked automatically when starting the application

```
docker compose up --build
```

---

### Status

```
docker compose ps
```

---

### Cleaning

```
docker compose kill         # stop containers
docker compose rm           # remove containers
docker compose down         # stop and remove containers
docker compose down -v      # remove everything including volumes
```

---

### Logs

We can see the log output from services running:

```
docker compose logs
```

If we want to review the logs of a specific service, e.g. web:

```
docker compose logs web
```

---

# Exercise

Create a compose file for running a nodejs app in `06-exercise-docker-compose` folder.

The `nodejs` app must be built by compose and emust expose port `5000` to your local port `9001`.

The app requires a redis service named `redis` to work.

---

# Other docker-compose examples

- [06-examples-compose/dotnet-minimal-web-api/docker-compose.yml](06-examples-compose/dotnet-minimal-web-api/docker-compose.yml)
- [06-examples-compose/dotnet-minimal-web-api/docker-compose.with-proxy.yml](06-examples-compose/dotnet-minimal-web-api/docker-compose.with-proxy.yml)
- [06-examples-compose/wordpress/docker-compose.yml](06-examples-compose/wordpress/docker-compose.yml)
- [06-examples-compose/voting-app/docker-compose.yml](06-examples-compose/voting-app/docker-compose.yml)
- https://github.com/docker/awesome-compose
