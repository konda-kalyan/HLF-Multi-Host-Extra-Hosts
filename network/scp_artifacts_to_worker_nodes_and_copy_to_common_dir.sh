#!/bin/bash -eu

#set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

#copy artifacts to Worker nodes
scp -r channel-artifacts crypto-config ubuntu@$ORG2_HOSTNAME:~/HLF-Multi-Host-Extra-Hosts/network
scp -r channel-artifacts crypto-config ubuntu@$ORG3_HOSTNAME:~/HLF-Multi-Host-Extra-Hosts/network

#On Workder nodes, copy artifacts to command dir (/var/mynetwork/)
ssh ubuntu@$ORG2_HOSTNAME 'cd ~/HLF-Multi-Host-Extra-Hosts/network; ./copy_crypto.sh'
ssh ubuntu@$ORG3_HOSTNAME 'cd ~/HLF-Multi-Host-Extra-Hosts/network; ./copy_crypto.sh'

# copy chaincodes as well
scp -r /var/mynetwork/chaincode/* ubuntu@$ORG2_HOSTNAME:~/HLF-Multi-Host-Extra-Hosts/chaincodes/
scp -r /var/mynetwork/chaincode/* ubuntu@$ORG3_HOSTNAME:~/HLF-Multi-Host-Extra-Hosts/chaincodes/
ssh ubuntu@$ORG2_HOSTNAME 'cd ~/HLF-Multi-Host-Extra-Hosts/chaincodes; sudo rm -rf /var/mynetwork/chaincode/*; sudo cp -r * /var/mynetwork/chaincode'
ssh ubuntu@$ORG3_HOSTNAME 'cd ~/HLF-Multi-Host-Extra-Hosts/chaincodes; sudo rm -rf /var/mynetwork/chaincode/*; sudo cp -r * /var/mynetwork/chaincode'
