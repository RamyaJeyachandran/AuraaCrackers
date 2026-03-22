FROM nginx:latest

# Remove default configuration if any
# RUN rm /etc/nginx/conf.d/default.conf

# Copy custom configuration
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# We stay with volumes for static and media as they change often
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
