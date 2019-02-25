# Ports mapping , volumes,…

## Ports mapping

Run custom static site image 

```
docker run --name static-site -e AUTHOR="Your Name" -d -P dockersamples/static-site
```

In the above command:

* `-d` will create a container with the process detached from our terminal
* `-P` will publish all the exposed container ports to random ports on the Docker host
* `-e` is how you pass environment variables to the container
* `--name` allows you to specify a container name
* `AUTHOR` is the environment variable name and Your Name is the value that you can pass

Now you can see the ports by running the `docker port` command.

```
$ docker port static-site
443/tcp -> 0.0.0.0:32768
80/tcp -> 0.0.0.0:32769
```
You can open http://localhost:[YOUR_PORT_FOR 80/tcp]. For our example this is http://localhost:32769.

Clean up the containers since you won't be using them anymore.
```
$ docker stop static-site
$ docker rm static-site
```
(shortcut : `docker rm -f static-site` )


Ok, but if I prefer mapping the ports on more clear I can do with th option `-p`.

First stop the container `docker stop static-site`
and now map the port 80 of the container to 8888 port of the host machine.
```
docker run --name static-site -e AUTHOR="Your Name" -d -p 8888:80 dockersamples/static-site
```
Options:
* `--publish , -p` Publish a container’s port(s) to the host

### Attach port to an existing container

```
docker stop <running-container-name>
docker run -p <new-port-mapping> <container-name-from-step-1>
```

## Volumes
TODO: https://training.play-with-docker.com/docker-volumes/ 