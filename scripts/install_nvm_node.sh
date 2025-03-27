#!/bin/bash
set -e

echo "Installing NVM (Node Version Manager)..."

# Download and install NVM
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Load NVM (to use it in the current shell session)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "NVM installed successfully."

echo "Installing Node.js (latest LTS version)..."

# Install the latest LTS version of Node.js
nvm install --lts

# Set the installed version as default
nvm use --lts
nvm alias default lts/*

echo "Node.js installation completed."
node -v
npm -v
