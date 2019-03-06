# Container vs VM

VMs are an infrastructure level construct to turn one machine into many servers
![](images/vm.png)

Containers are an app level construct
![](images/containers.png)


# Container 

## What Is A Linux Container?

Each container will have its isolated user space and you can run multiple containers on a host, each having its own user space. It means you can run different Linux systems (containers) on a single host. For example, you can run an RHEL and a SUSE container on an Ubuntu server. The Ubuntu Server can be a virtual machine or a physical host.

![](images/linux-containers.png)

Containers are isolated in a host using the two Linux kernel features called namespaces and control groups.

### Namespaces
There are six namespaces in Linux (mnt, IPC, net, usr etc.).
Using these namespaces a container can have its own network interfaces, IP address etc.
Each container will have its own namespace and the processes running inside that namespace will not have any privileges outside its namespace.

### Control groups
The resources used by a container is managed by Linux control groups.
You can decide on how much CPU and memory resource a container should use using Linux control groups.

## What Is Docker ?

Docker is a popular open source project based on Linux containers.
Docker is basically a container engine which uses the Linux Kernel features like namespaces and control groups to create containers on top of an operating system and automates application deployment on the container.
It provides a lightweight environment to run your application code. Docker has an efficient workflow for moving your application from developers laptop, test environment to production.

**Docker Client** enables users to interact with Docker.

**The Docker host** provides a complete environment to execute and run applications. (Daemon, Images, Containers, Networks, and Storage.)

![](images/docker-engine.png)

# Docker objects

**Images** are a read-only binary template used to build containers.
A Docker image is made up of filesystems layered over each other.
Docker uses Copy-on-write union file system for its backend storage.
Whenever changes are made to a container, only the changes will be written to disk using copy on write model.
![](images/layers.jpg)

**Containers** The image when it is ‘running.’ The standard unit for app service.

**Networking** Docker implements networking  in an application-driven manner and provides various options while maintaining enough abstraction for application developers.

**Storage**

![](images/types-of-mounts-volume.png)

**Volumes** provide the ability to create persistent storage, with the ability to rename volumes, list volumes, and also list the container that is associated with the volume

**Docker registries** Stores, distributes and manages Docker images


