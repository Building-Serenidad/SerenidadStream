# Using tiangolo/nginx-rtmp as the base image, based on Debian
FROM tiangolo/nginx-rtmp

# Update apt and install Certbot without adding unnecessary repositories
RUN apt-get update && \
    apt-get install -y certbot python3-certbot-nginx

# Copy the Nginx configuration files and web content
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/

# Copy the entrypoint script and set permissions
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
