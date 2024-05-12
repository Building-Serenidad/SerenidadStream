# Using tiangolo/nginx-rtmp as the base image, based on Debian
FROM tiangolo/nginx-rtmp

# Set non-interactive installation to avoid getting stuck at prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install Certbot with nginx plugin, handling configuration file prompts
RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    apt-get -y -o Dpkg::Options::="--force-confnew" install certbot python3-certbot-nginx

# Clean up to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the Nginx configuration files and web content
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/

# Copy the entrypoint script and set permissions
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set back to default for interactive container run
ENV DEBIAN_FRONTEND=

# Use the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
