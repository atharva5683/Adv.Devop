#!/bin/bash

# Update package lists
echo "Updating package lists..."
if sudo apt-get update; then
    echo "Package lists updated successfully."
else
    echo "Failed to update package lists. Exiting."
    exit 1
fi

# Install Nginx
echo "Installing Nginx..."
if sudo apt-get install -y nginx; then
    echo "Nginx installed successfully."
else
    echo "Failed to install Nginx. Exiting."
    exit 1
fi

# Check Nginx status
echo "Checking Nginx status..."
if systemctl is-active --quiet nginx; then
    echo "Nginx is active and running."
else
    echo "Nginx is installed but not running. You may need to start the service manually."
fi
