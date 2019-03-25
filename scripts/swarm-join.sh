#!/bin/sh
MANAGER_IP=`getent hosts manager1 | awk '{ print $1 }'`

# Leave swarm in cas of the node is already in
docker swarm leave -f > /dev/null 2>&1 

# Retreive worker token
JOIN_WORKER_TOKEN=$(cat /tokens/worker)
echo "Token: ${JOIN_WORKER_TOKEN}"

# Add a node to the swarm
docker swarm join \
  --token ${JOIN_WORKER_TOKEN} \
  ${MANAGER_IP}
