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
