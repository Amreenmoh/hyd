# Use the official NGINX image to serve static content
FROM nginx:latest

# Copy your website files into the container
COPY ./ /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80
