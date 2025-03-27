#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Java 17 (required for Jenkins)
sudo apt install openjdk-17-jdk -y

# Verify Java installation
java -version

# Add Jenkins repository key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list

# Update package list
sudo apt update

# Install Jenkins
sudo apt install jenkins -y

# Start and enable Jenkins service
sudo systemctl enable --now jenkins

# Allow Jenkins through firewall
sudo ufw allow 8080/tcp

# Check Jenkins status
sudo systemctl status jenkins
