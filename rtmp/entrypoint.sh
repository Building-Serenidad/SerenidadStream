#!/bin/bash

# Ensure nginx is not running yet
service nginx stop

# Make sure directory exists for webroot challenge
mkdir -p /www/letsencrypt

# Try to renew or get new certificates
certbot certonly --webroot --webroot-path=/www/letsencrypt -d serenidad.click -d www.serenidad.click --email your-email@example.com --agree-tos --non-interactive --verbose --logs-dir /var/log/letsencrypt

# Check certificates
ls -la /etc/letsencrypt/live/serenidad.click/

# Start nginx
nginx -g 'daemon off;'
