# Docker stack

## Swarm

https://docs.docker.com/get-started/part3/

`docker-compose.yml`

```yaml
services:
  web:
    # replace username/repo:tag with your name and image details
    image: username/repo:tag
    deploy:
      replicas: 5
      resources:
        limits:
          cpus: "0.1"
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - "4000:80"
    networks:
      - webnet
networks:
  webnet:
```


```
docker swarm init
docker stack deploy -c docker-compose.yml getstartedlab
docker service ls
docker stack services getstartedlab
docker service ps getstartedlab_web
docker container ls -q
```

You can scale the app by changing the replicas value in docker-compose.yml
```
docker stack deploy -c docker-compose.yml getstartedlab
```

Take the app down
```
docker stack rm getstartedlab
```

Take down the swarm.
```
docker swarm leave --force
```

## Cheat sheet
```
docker stack ls                                            # List stacks or apps
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker service ls                 # List running services associated with an app
docker service ps <service>                  # List tasks associated with an app
docker inspect <task or container>                   # Inspect task or container
docker container ls -q                                      # List container IDs
docker stack rm <appname>                             # Tear down an application
docker swarm leave --force      # Take down a single node swarm from the manager
```


## Kubernetes

Configure kubenretes cluster

https://docs.docker.com/docker-for-mac/#kubernetes
https://docs.docker.com/docker-for-mac/kubernetes/


```
kubectl config get-contexts 
kubectl config use-context docker-for-desktop
kubectl get nodes
```

```
docker stack ls  
```

```
docker stack deploy --orchestrator kubernetes --compose-file 05-example-compose/docker-compose.yml holwp
```