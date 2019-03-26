# Swarm in docker

This project aims to ease a swarm setup inside a container, for testing purposes.

## Setup

Requirements

* docker
* docker-compose

Use the following commands to start the swarm

```sh
$ git clone git@github.com:mguimard/swarm-in-docker.git
$ cd swarm-in-docker
$ sh start.sh
```

Navigate to http://localhost:7000 and configure the manager node endpoint

* Name: manager1
* Endpoint URL: manager1:2375
* Public IP: manager1



