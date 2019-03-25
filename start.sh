#!/bin/sh

# This script starts the docker-compose stack described 
# in docker-compose.yml and inits the swarm

echo "Cleaning the stack components"
docker-compose rm -f -v

echo "Starting up the stack"
docker-compose up -d --build --force-recreate --remove-orphans

echo "Init the swarm on manager1"
docker exec -ti manager1 sh /swarm-init.sh

echo "Join the swarm on worker1"
docker exec -ti worker1 sh /swarm-join.sh

echo "Join the swarm on worker2"
docker exec -ti worker2 sh /swarm-join.sh

echo "Open your browser at http://localhost:7000/#/swarm/visualizer to visualize the swarm cluster"