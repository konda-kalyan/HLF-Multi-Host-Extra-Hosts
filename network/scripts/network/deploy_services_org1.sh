#!/bin/bash

GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION
set -ev 

# ORG 1

docker-compose -f  docker-compose-org1.yml up -d
sleep 3
