# Swarm in docker

This project aims to ease a swarm setup inside a container, for testing purposes.

## Setup

Requirements

* docker
* docker-compose

Clone this project and run `docker-compose up`

```sh
$ git clone git@github.com:mguimard/swarm-in-docker.git
$ cd swarm-in-docker
$ sh start.sh
```

Navigate to http://localhost:7000 and configure the manager node endpoint

* Name: manager1
* Endpoint URL: manager1:2375
* Public IP: manager1



