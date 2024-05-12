#!/bin/bash

# Stop nginx service if running (optional depending on your setup)
service nginx stop

# Generate or renew the certificates
certbot certonly --standalone --preferred-challenges http -d serenidad.click -d www.serenidad.click --non-interactive --agree-tos --email your-email@example.com --force-renewal

# Start nginx
nginx -g 'daemon off;'
