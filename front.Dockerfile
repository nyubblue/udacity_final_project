# Use a base image
FROM nginx:latest

# Copy the contents of the 'dist' directory (where your front-end code resides) to the nginx default directory
COPY . dist/ /usr/share/nginx/html

# Expose port 80 (default port for nginx)
EXPOSE 80

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]