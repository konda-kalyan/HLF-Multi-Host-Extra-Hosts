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

./pull-fabric-images.sh
./get-fabrc-binaries.sh

./scp_env_file_to_other_orgs_nodes.sh

ssh ubuntu@$ORG2_HOSTNAME 'cd ~/HLF-Multi-Host-Extra-Hosts/network; ./pull-fabric-images.sh; ./get-fabrc-binaries.sh'
ssh ubuntu@$ORG3_HOSTNAME 'cd ~/HLF-Multi-Host-Extra-Hosts/network; ./pull-fabric-images.sh; ./get-fabrc-binaries.sh'


./bring_down_whole_network_on_all_machines.sh
./clean_artifacts_on_all_machines.sh
