ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

sudo cp -R ./org4-artifacts/crypto-config/peerOrganizations/* /var/mynetwork/certs/crypto-config/peerOrganizations

#copy artifacts to Org4 nodes
scp -r channel-artifacts crypto-config org4-artifacts ubuntu@ip-172-31-37-174:~/HLF-Multi-Host-Extra-Hosts/network

#On Org4, copy artifacts to command dir (/var/mynetwork/)
ssh ubuntu@ip-172-31-37-174 'cd ~/HLF-Multi-Host-Extra-Hosts/network; ./copy_crypto.sh; sudo cp -R ./org4-artifacts/crypto-config/peerOrganizations/* /var/mynetwork/certs/crypto-config/peerOrganizations;'

scp -r /var/mynetwork/chaincode/* ubuntu@ip-172-31-37-174:~/HLF-Multi-Host-Extra-Hosts/chaincodes/
ssh ubuntu@ip-172-31-37-174 'cd ~/HLF-Multi-Host-Extra-Hosts/chaincodes; sudo rm -rf /var/mynetwork/chaincode/*; sudo cp -r * /var/mynetwork/chaincode'

