# Using the official nginx image as the base image
FROM nginx:latest

# Copying the content of the app to the nginx html directory
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 8000 to the outside world
EXPOSE 8000

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
