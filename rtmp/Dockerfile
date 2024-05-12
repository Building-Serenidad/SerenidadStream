# Using tiangolo/nginx-rtmp as the base image
FROM tiangolo/nginx-rtmp

# Install software-properties-common to manage repositories, and then add the universe repository
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update

# Install Certbot and its Nginx plugin
RUN apt-get install -y certbot python3-certbot-nginx

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
