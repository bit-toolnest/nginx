#!/bin/bash
set -e

# uninstaller.sh — Uninstall Nginx if installed

# Check if nginx is installed
if command -v nginx >/dev/null 2>&1; then
    echo "Nginx detected. Removing..."

    # Stop and disable nginx service
    sudo systemctl stop nginx || true
    sudo systemctl disable nginx || true

    # Remove nginx package
    sudo apt-get remove --purge -y nginx nginx-common nginx-core

    # Clean up unused dependencies
    sudo apt-get autoremove -y
    sudo apt-get clean

    # Optionally remove leftover config/log directories
    sudo rm -rf /etc/nginx /var/log/nginx /var/lib/nginx

    echo "Nginx has been uninstalled."
else
    echo "Nginx is not installed. Nothing to remove."
fi
