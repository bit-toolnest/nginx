#!/bin/bash
set -e

# install.sh — Install Nginx if not already installed

# Check if nginx is installed
if ! command -v nginx >/dev/null 2>&1; then
    echo "Nginx not found. Installing..."

    # Update package index
    sudo apt-get update -y

    # Install nginx
    sudo apt-get install -y nginx

    echo "Nginx installation complete."
else
    echo "Nginx is already installed."
fi

# Ensure nginx service is enabled and started
sudo systemctl enable nginx
sudo systemctl start nginx

# Show status
sudo systemctl status nginx --no-pager
