#!/bin/sh
HOST_IP=daemon1
WORKER_IP=daemon2

# Init the swarm
docker swarm init \
  --advertise-addr=$HOST_IP \
  --listen-addr $HOST_IP:2377

# Get the worker join token
TOKEN=$(docker swarm join-token -q worker)

# Add a node to the swarm
docker swarm join \
  --token $TOKEN \
  $WORKER_IP

# Create an overlay network
docker network create \
  --driver=overlay \
  $NETWORK_NAME

