#!/bin/bash
set -e

bash scripts/install_docker.sh
bash scripts/install_nvm_node.sh
bash scripts/install_vscode.sh
bash scripts/install_jenkins.sh

echo "All software installed successfully."
