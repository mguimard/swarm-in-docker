#!/bin/sh
MANAGER_IP=`getent hosts manager1 | awk '{ print $1 }'`
NETWORK_NAME=swarm_overlay

# Leave in case of already in swarm
docker swarm leave -f > /dev/null 2>&1

echo "# IP discovered:"
echo "manager1 ${MANAGER_IP}"

echo "# Initializing the swarm..."
docker swarm init \
  --advertise-addr=${MANAGER_IP} \
  --listen-addr ${MANAGER_IP}:2377

# Get the worker join token
echo "# Retrieve worker token..."
JOIN_WORKER_TOKEN=$(docker swarm join-token -q worker)
echo "Token: ${JOIN_WORKER_TOKEN}"

# Share the token to other containers
echo ${JOIN_WORKER_TOKEN} > /tokens/worker

echo "# Creating the overlay network...."
# Create an overlay network
docker network create \
  --driver=overlay \
  ${NETWORK_NAME}

