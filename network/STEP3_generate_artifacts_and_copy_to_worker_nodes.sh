#!/bin/bash

./generate_crypto.sh
./populate_hostname_and_ca_sk_files.sh
./copy_crypto.sh
./scp_artifacts_to_other_nodes_and_copy_to_common_dir.sh
