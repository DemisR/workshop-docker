# Images and docker hub usage

We have downloaded few images. For list all images on your laptop user the command

```
docker image ls
```

You can find existing images at http://hub.docker.com
or by using the command `docker search <name>`. 
For example, to find an image for Redis, you would use 

```
docker search redis
```


## Image creation from a container

Let’s start by running an interactive shell in a ubuntu container.
```
docker container run -ti ubuntu bash
```

Customize the running container.

```
apt-get update
apt-get install -y figlet
figlet "hello docker"
exit
```

List containers
```
docker container ls -a
```

(There is no difference between `docker ps` and `docker container ls`.
The new command structure `docker container <subcommand>` was added in Docker 1.13 to provider a more structured user experience when using the command line.)


Before we create our own image, we might want to inspect all the changes we made. 
Try typing the command `docker container diff <container ID>` for the container you just created.

Now, to create an image we need to **commit** this container.
Commit creates an image locally on the system running the Docker engine.
Run the following command, using the container ID you retrieved, in order to commit the container and create an image out of it.

```
docker commit <container_id>
```

That’s it - you have created your first image! Once it has been commited, we can see the newly created image in the list of available images.

```
$ docker image ls
REPOSITORY                                       TAG                 IMAGE ID            CREATED             SIZE
<none>                                           <none>              86689db6d409        20 seconds ago      114MB
ubuntu                                           latest              47b19964fb50        2 weeks ago         88.1MB
```

There are no tags on the image. Add it with

```
docker image tag <IMAGE_ID> myfirstimage
```

```
$ docker image ls
REPOSITORY                                       TAG                 IMAGE ID            CREATED             SIZE
myfirstimage                                     latest              86689db6d409        2 minutes ago       114MB
ubuntu                                           latest              47b19964fb50        2 weeks ago         88.1MB
```

Now we will run a container based on the newly created *myfirstimage* image:

```
docker container run myfirstimage figlet "Hands on lab"
```


Check out the image you created earlier by using the history command (use the `docker image ls` command to find your image IDs):

```
docker image history <image ID>
```