#!/bin/bash

# Requesting Let's Encrypt certificate
certbot --nginx -d serenidad.click -d www.serenidad.click --non-interactive --agree-tos --email thomas@serenidad.app --redirect

# Setting up automatic renewal in a cron job
echo "0 12 * * * /usr/bin/certbot renew --quiet" >> /etc/crontab

# Start nginx in the foreground
exec "$@"
