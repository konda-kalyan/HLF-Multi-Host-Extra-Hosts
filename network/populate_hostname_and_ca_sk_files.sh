#!/bin/bash

#set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

FLAG="-i"
ARCH=$(uname)
if [ "$ARCH" == "Linux" ]; then
  FLAG="-i"
elif [ "$ARCH" == "Darwin" ]; then
  FLAG="-it"
fi

# CA SERVER KEY file
ORG1_CA_PATH=$(ls ./crypto-config/peerOrganizations/org1.example.com/ca/ | grep "_sk")
sed "$FLAG" "s#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/.*#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/$ORG1_CA_PATH#g" $ORG1_COMPOSE_PATH
ORG2_CA_PATH=$(ls ./crypto-config/peerOrganizations/org2.example.com/ca/ | grep "_sk")
sed "$FLAG" "s#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/.*#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/$ORG2_CA_PATH#g" $ORG2_COMPOSE_PATH
ORG3_CA_PATH=$(ls ./crypto-config/peerOrganizations/org3.example.com/ca/ | grep "_sk")
sed "$FLAG" "s#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/.*#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/$ORG3_CA_PATH#g" $ORG3_COMPOSE_PATH

# Fabric version docker image replacement
sed "$FLAG" "s/fabric-orderer.*/fabric-orderer:$FABRIC_VERSION/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/fabric-peer.*/fabric-peer:$FABRIC_VERSION/g" $ORG1_COMPOSE_PATH $ORG3_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\/fabric-ca:.*/\/fabric-ca:$FABRIC_CA_VERSION/g" $ORG1_COMPOSE_PATH $ORG3_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/fabric-tools.*/fabric-tools:$FABRIC_VERSION/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/fabric-couchdb.*/fabric-couchdb:$COUCHDB_IMAGE_VERSION/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH

# Host IP addresses replacement
sed "$FLAG" "s/\"peer0.org1.example.com:.*\"/\"peer0.org1.example.com:$ORG1_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"couchdb.peer0.org1.example.com:.*\"/\"couchdb.peer0.org1.example.com:$ORG1_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"peer1.org1.example.com:.*\"/\"peer1.org1.example.com:$ORG1_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"couchdb.peer1.org1.example.com:.*\"/\"couchdb.peer1.org1.example.com:$ORG1_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"orderer1.example.com:.*\"/\"orderer1.example.com:$ORG1_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"peer0.org2.example.com:.*\"/\"peer0.org2.example.com:$ORG2_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"couchdb.peer0.org2.example.com:.*\"/\"couchdb.peer0.org2.example.com:$ORG2_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"peer1.org2.example.com:.*\"/\"peer1.org2.example.com:$ORG2_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"couchdb.peer1.org2.example.com:.*\"/\"couchdb.peer1.org2.example.com:$ORG2_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"orderer2.example.com:.*\"/\"orderer2.example.com:$ORG2_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"peer0.org3.example.com:.*\"/\"peer0.org3.example.com:$ORG3_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH 
sed "$FLAG" "s/\"couchdb.peer0.org3.example.com:.*\"/\"couchdb.peer0.org3.example.com:$ORG3_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH 
sed "$FLAG" "s/\"peer1.org3.example.com:.*\"/\"peer1.org3.example.com:$ORG3_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH
sed "$FLAG" "s/\"couchdb.peer1.org3.example.com:.*\"/\"couchdb.peer1.org3.example.com:$ORG3_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH 
sed "$FLAG" "s/\"orderer3.example.com:.*\"/\"orderer3.example.com:$ORG3_HOSTNAME\"/g" $ORG1_COMPOSE_PATH $ORG2_COMPOSE_PATH $ORG3_COMPOSE_PATH


if [ "$ARCH" == "Darwin" ]; then
  rm */**.ymlt
fi
