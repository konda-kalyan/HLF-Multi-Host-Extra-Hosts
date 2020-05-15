#!/bin/bash -eu
# Copyright London Stock Exchange Group All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#
# This script pulls docker images from the Dockerhub hyperledger repositories

#set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

scp -r .env ubuntu@$ORG2_HOSTNAME:~/HLF-Multi-Host-Extra-Hosts/network
scp -r .env ubuntu@$ORG3_HOSTNAME:~/HLF-Multi-Host-Extra-Hosts/network
