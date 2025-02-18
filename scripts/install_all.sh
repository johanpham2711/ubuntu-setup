#!/bin/bash
set -e

bash scripts/install_docker.sh
bash scripts/install_nvm_node.sh

echo "All software installed successfully."
