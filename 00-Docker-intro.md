---
marp: true
---

# Container vs VM

---

## VM

A Virtual Machine is a system which acts exactly like a computer.

In simple terms, it makes it possible to run what appears to be on many separate computers on hardware, that is one computer.

Each virtual machine requires its underlying operating system, and then the **hardware is virtualized**.

![bg right contain](images/intro_vms.png)

---

Containers are **lightweight** software packages that **contain all the dependencies** required to execute the contained software application.
![bg right contain](images/intro_containers.png)

---

# VM vs Container

| Virtual Machine                      | Container                                        |
| :----------------------------------- | :----------------------------------------------- |
| Hardware-level process isolation     | OS level process isolation                       |
| Startup time in minutes              | Startup time in seconds                          |
| Heavyweight (GBs)                    | Lightweight (KBs/MBs)                            |
| Ready-made VMs are difficult to find | Pre-built docker containers are easily available |
| More resource usage                  | Less resource usage                              |

---

# Container

---

## What is really a Container?

**Isolated** group of processes with **resource limits** usage running **on a host**.

You can run different Linux systems (containers) on a single host.

For example, you can run an RHEL and a SUSE container on an Ubuntu server.
The Ubuntu Server can be a virtual machine or a physical host.

---

![bg right:65% 65%](images/docker_and_linux_kernel.png)

Containers are composed using multiple independent features

- namespaces
- cgroups
- security capabilities like seccomp, LSMs...
- and some filesystem magic

---

### Namespaces

- Namespaces define **groups of processes that share a common view regarding specific system resources.**
  Using these namespaces a container can have its own network interfaces, IP address etc.

- A process can be a member of multiple namespaces at once.

- When you run a container, Docker creates a **set of namespaces for that container** to provide a layer of isolation.

---

### Control groups

A control group (**cgroup**) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, and so on) of a collection of processes.

---

## What Is Docker ?

Docker is basically a container engine which uses the Linux Kernel features like namespaces and control groups to create containers on top of an operating system and automates application deployment on the container.

It provides a lightweight environment to run your application code.

Docker has an efficient workflow for moving your application from developers laptop, test environment to production.

---

**Docker Client** enables users to interact with Docker.

**The Docker host** provides a complete environment to execute and run applications. (Daemon, Images, Containers, Networks, and Storage.)

![bg right contain](images/docker-engine.png)

---

# Docker objects

---

## Images

- **read-only** binary template used to build containers
- made up of filesystems **layered** over each other
- Docker uses **Copy-on-write** union file system for its backend storage
- Whenever changes are made to a container,
  only the changes will be written to disk using copy on write model.

![bg right:60% 80%](images/layers.jpg)

---

![bg contain](images/why-are-containers-lightwight.png)

---

## Container

![bg left contain](images/image_vs_container.png)

**Containers** The image when it is 'running'.
The standard unit for app service.

---

![bg left:60% 80%](images/base_cnm.png)
**Networking** Docker implements networking in an application-driven manner and provides various options while maintaining enough abstraction for application developers.

---

## Volumes

![bg right contain](images/types-of-mounts-volume.png)

**Volumes** provide the ability to create persistent storage, with the ability to rename volumes, list volumes, and also list the container that is associated with the volume

---

## Registry

![bg left:60% 80%](images/base_registry.png)
**Docker registries** Stores, distributes and manages Docker images
