Network topology and different components:
•	Fabric network with 3 organizations installed in 3 physical machines (or 3  VMs).
•	RAFT based ordering service with 3 Orderers (one per each organization).
•	One Fabric CA per organization
•	Couchdb as world state in each and every peer.
•	One Channel called ‘mychannel’
•	3 Chaincodes (1. Simple Chaincode written in ‘go’ language, 2. Simple Chaincode written in ‘java’ language, 3. Chaincode written in ‘java’ language with CouchDB rich queries)

Used ‘Docker Swarm’ as container orchestration tool.

IMPORTANT NOTE: This example sets up network on AWS environment. If you are using non-AWS envi then you need to remove AWS references in .env file and docker compose files, and then configure cloud/local settings accordingly

Follow 'HLF_Multi_Node_Network_Setup_Using_Docker_Swarm.docx' document to setup HLF network.

Refer 'Adding_new_Organization_dynamically.docx" to add new Organization dynamically to existing running network. Please note that 'Adding new Org is working fine almost upto 95%. There may be small improments/corrections are required'

Refer 'Hyperledger_Explorer_Setup.docx' to setup Hyperledger Explorer for this network. Refer 'blockchain-explorer-sample-config-files' directory for some sample configuration files.


Queries - Contact at 'konda.kalyan@gmail.com'
