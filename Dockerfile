FROM nginx:alpine

# Copy nginx vhost directives
COPY nginx/conf.d /etc/nginx/conf.d
