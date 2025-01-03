#!/bin/bash

# Start the Nginx service
echo "Starting Nginx service..."
if sudo service nginx start; then
    echo "Nginx started successfully."
else
    echo "Failed to start Nginx. Please check the logs for more details."
    exit 1
fi
