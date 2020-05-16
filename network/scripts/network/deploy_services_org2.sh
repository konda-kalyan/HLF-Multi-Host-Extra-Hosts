#!/bin/bash

GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION
set -ev 

# ORG 2

docker-compose -f  docker-compose-org2.yml up -d
sleep 3
