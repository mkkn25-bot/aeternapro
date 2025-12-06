#!/bin/bash

# Aeterna VPS Setup Script
# Run this as root on your VPS

echo "--- Installing Nginx and Certbot ---"
apt-get update
apt-get install -y nginx certbot python3-certbot-nginx

echo "--- Configuring Nginx ---"
# Remove default if exists
rm -f /etc/nginx/sites-enabled/default

# Copy config
cp nginx_aeterna.conf /etc/nginx/sites-available/aeterna.conf

# Link config
ln -sf /etc/nginx/sites-available/aeterna.conf /etc/nginx/sites-enabled/

# Test config
nginx -t

if [ $? -eq 0 ]; then
    echo "Nginx configuration is valid."
    systemctl reload nginx
    echo "--- Nginx configured! ---"
    echo "Now run the following command to enable HTTPS:"
    echo "certbot --nginx -d aeternapro.fr -d www.aeternapro.fr"
else
    echo "Nginx configuration FAILED. Please check errors above."
fi
