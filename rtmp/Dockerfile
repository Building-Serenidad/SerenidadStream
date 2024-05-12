FROM tiangolo/nginx-rtmp

# Install Certbot for SSL certificate generation
# Assuming you are using a Debian-based image
RUN apt-get update && \
    apt-get install -y software-properties-common certbot python3-certbot-nginx

# Copy your existing configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/

# Set up entrypoint to handle certificate renewal and nginx startup
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
