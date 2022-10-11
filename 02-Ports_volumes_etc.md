---
marp: true
---

# Ports mapping , volumes,…

---

## Ports mapping

Run custom static site image

```
docker run --name static-site -e AUTHOR="Your Name" -d -P dockersamples/static-site
```

In the above command:

- `-d` will create a container with the process detached from our terminal
- `-P` will publish all the exposed container ports to random ports on the Docker host
- `-e` is how you pass environment variables to the container
- `--name` allows you to specify a container name
- `AUTHOR` is the environment variable name and Your Name is the value that you can pass

---

Now you can see the ports by running the `docker port` command.

```
$ docker port static-site
443/tcp -> 0.0.0.0:32768
80/tcp -> 0.0.0.0:32769
```

You can open http://localhost:[YOUR_PORT_FOR 80/tcp].
For our example this is http://localhost:32769.

---

Clean up the containers since you won't be using them anymore.

```
$ docker stop static-site
$ docker rm static-site
```

(shortcut : `docker rm -f static-site` )

---

If I prefer mapping the port on a specific one I can do it with option `-p`.

First of all, stop the container `docker stop static-site`
and now map port 80 of the container to 8888 port of the host machine.

```
docker run --name static-site -e AUTHOR="Your Name" -d -p 8888:80 dockersamples/static-site
```

Options:

- `--publish , -p` Publish a container's port(s) to the host

---

### Attach port to an existing container

```
docker stop <running-container-name>
docker run -p <new-port-mapping> <container-name-from-step-1>
```

---

## Volumes

Basically, volumes are special directories in containers "mounted" from somewhere.

Docker volumes are useful for living some files out of docker or sharing a directory/file between multiple containers/hosts.

You can use local storage or a remote storage (plugins or custom).

---

Volumes can be defined directly in Dockerfie

```
VOLUME /uploads
```

or from command-line

```
docker run -d -v /uploads myapp
```

---

- When you `docker commit`, **the content of volumes is not brought into the resulting image**.

- If a `RUN` instruction in a Dockerfile changes the content of a volume, those changes are neither recorded.

- If a container is started with the `--read-only` flag, **the volume still be writable** (unless the volume is a read-only volume).

- **You can share volumes** between containers using `--volumes-from` flag for `docker run`.

---

**Example**
Let's start a Tomcat container:

```
$ docker run --name webapp -d -p 8080:8080 -v /usr/local/tomcat/logs tomcat
```

Now, start an alpine container accessing the same volume:

```
$ docker run --volumes-from webapp alpine sh -c "tail -f /usr/local/tomcat/logs/*"
```

Then, from another window, send requests to our Tomcat container:

```
$ curl localhost:8080
```

To list volumes use `docker volume ls`.

---

### Naming volumes

Volumes can be created without a container, then used in multiple containers.

```
$ docker volume create mycustomwebsite
```

Volumes are not anchored to a specific path.

---

Let's start a web server using the two previous volumes.

```
$ docker run -d -p 1234:80 -v mycustomwebsite:/usr/share/nginx/html nginx
```

check using `curl localhost:1234`.

---

Let's start another container using the **html** volume.

```
$ docker run -v mycustomwebsite:/html --workdir /html -ti alpine vi index.html
```

Edit the page, save and exit.
Run `curl localhost:1234` again to see your changes.

---

### Volumes typical usage: databases

PostgreSQL data
```
$ docker volume create mydata
$ docker run -it --rm \
    --name mydb \
    -v mydata:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=mysecretpassword \
    postgres:13
```

```
$ docker exec -ti mydb psql -U postgres
postgres=# CREATE DATABASE mydb;
postgres=# \q
```