#!/bin/bash

#set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

# ORG1
rm -rf channel-artifacts
rm -rf crypto-config

# ORG2
ssh ubuntu@$ORG2_HOSTNAME 'cd ~/HLF-Multi-Host-Extra-Hosts/network; rm -rf channel-artifacts; rm -rf crypto-config; rm -rf ~/HLF-Multi-Host-Extra-Hosts/chaincodes/*'

# ORG3
ssh ubuntu@$ORG3_HOSTNAME 'cd ~/HLF-Multi-Host-Extra-Hosts/network; rm -rf channel-artifacts; rm -rf crypto-config; rm -rf ~/HLF-Multi-Host-Extra-Hosts/chaincodes/*'
