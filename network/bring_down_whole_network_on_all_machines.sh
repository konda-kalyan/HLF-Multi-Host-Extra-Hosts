#!/bin/bash

#set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION


docker service rm $(docker service ls -q)	# this will stop all docker coninters on all 3 nodes
sleep 10

# Clean things on ORG1 first
sudo docker stop $(sudo docker ps -aq); sudo docker rm -f $(sudo docker ps -aq);
#docker swarm leave -f
#docker network rm docker_gwbridge
docker system prune -f
#docker rmi $(docker images | grep "peer0.org1.example.com" | awk '{print $3}')

# Clean things on ORG2 next
ssh ubuntu@$ORG2_HOSTNAME 'sudo docker stop $(sudo docker ps -aq); sudo docker rm -f $(sudo docker ps -aq); docker system prune -f'

# Clean things on ORG3 next
ssh ubuntu@$ORG3_HOSTNAME 'sudo docker stop $(sudo docker ps -aq); sudo docker rm -f $(sudo docker ps -aq); docker system prune -f'
