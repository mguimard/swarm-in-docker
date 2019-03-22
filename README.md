# Swarm in docker

This project aims to ease a swarm setup inside a container, for testing purposes.

## Setup

```sh
$ docker build -t swarm-in-docker .
$ docker run --name myswarm \
    -p 7000-7100:7000-7100 \
    --privileged \
    -it -d \
   swarm-in-docker
```
