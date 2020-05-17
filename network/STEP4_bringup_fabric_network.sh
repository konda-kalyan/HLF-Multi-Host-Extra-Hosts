#!/bin/bash

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

#### Bringup Fabric network. Start all containers
./start_all.sh
#sleep 20
