#!/bin/bash
# This script installs the CodeDeploy agent and its prerequisites on Ubuntu 22.04 dynamically.

set -e  # Exit immediately if a command exits with a non-zero status.

# Function to get the region dynamically if running on an EC2 instance
get_region() {
  if [ -f /etc/system-release ]; then
    curl -s http://169.254.169.254/latest/meta-data/placement/region
  else
    echo "us-east-1"  # Default region if not on EC2
  fi
}

# Get the region dynamically or set it manually
AWS_REGION=$(get_region)
echo "Using AWS region: $AWS_REGION"

# Update system packages
sudo apt-get update

# Install necessary dependencies
sudo apt install -y ruby-full wget curl unzip

# Navigate to the home directory
cd /home/ubuntu

# Download the latest CodeDeploy install script for the determined region
INSTALL_URL="https://aws-codedeploy-$AWS_REGION.s3.$AWS_REGION.amazonaws.com/latest/install"
echo "Downloading CodeDeploy install script from $INSTALL_URL"
wget "$INSTALL_URL" -O install
chmod +x ./install

# Install the CodeDeploy agent
sudo ./install auto

# Install AWS CLI (version 2)
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install

# Prompt user to configure AWS CLI
echo "Configure AWS CLI to access AWS services."
echo "Run 'aws configure' and provide your AWS Access Key, Secret Key, region ($AWS_REGION), and output format (e.g., json)."
aws configure

# List available .deb packages in the S3 bucket
echo "Fetching available .deb packages in CodeDeploy S3 bucket..."
aws s3 ls "s3://aws-codedeploy-$AWS_REGION/releases/" --region "$AWS_REGION" | grep '\.deb$'

# Automatically install the CodeDeploy agent from the listed packages
echo "Installing CodeDeploy agent from the latest .deb package..."
sudo ./install auto -v releases/codedeploy-agent-###.deb  # Replace ### with the correct version dynamically if needed

# Start and check the status of the CodeDeploy agent
sudo systemctl start codedeploy-agent
sudo systemctl enable codedeploy-agent
echo "CodeDeploy agent status:"
sudo systemctl status codedeploy-agent
