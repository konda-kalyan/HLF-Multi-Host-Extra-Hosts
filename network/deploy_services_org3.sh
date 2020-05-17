#!/bin/bash

GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION
set -ev 

# ORG 3

docker-compose -f  docker-compose-org3.yml up -d
sleep 3
