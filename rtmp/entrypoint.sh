#!/bin/bash

# Stop nginx service if running (optional depending on your setup)
service nginx stop

# Log the existing certificates (add this line for debugging)
ls -la /etc/letsencrypt/live/serenidad.click/

# Generate or renew the certificates
certbot certonly --standalone --preferred-challenges http -d serenidad.click -d www.serenidad.click --non-interactive --agree-tos --email your-email@example.com --force-renewal

# Log the certificates again after renewal attempt
ls -la /etc/letsencrypt/live/serenidad.click/

# Start nginx
nginx -g 'daemon off;'
