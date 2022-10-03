---
marp: true
---

# Orchestartion

Container orchestration is all about managing the lifecycles of containers, especially in large, dynamic environments.

---

Container orchestration control and automate many tasks:

- Provisioning and deployment of containers
- Redundancy and availability of containers
- Scaling up or removing containers to spread application load evenly across host infrastructure
- Movement of containers from one host to another if there is a shortage of resources in a host, or if a host dies
- Allocation of resources between containers
- External exposure of services running in a container with the outside world
- Load balancing of service discovery between containers
- Health monitoring of containers and hosts
- Configuration of an application in relation to the containers running it

---

## Some orchestrators

---

### Kubernetes

- Open Source project initiated by Google.
- Contributions from many other actors.
- De facto standard for container orchestration.
- Many deployment options; some of them very complex.
- Reputation: steep learning curve. ( if we focus on what matters. Not so complex. )

---

### Swarm

- Tightly integrated with the Docker Engine.
- Extremely simple to deploy and setup, even in multi-manager (HA) mode.
- Secure by default.
- Strongly opinionated:
  - smaller set of features,
  - easier to operate.

---

### Nomad

### Mesos
