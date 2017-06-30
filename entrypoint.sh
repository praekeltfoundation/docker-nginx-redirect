#!/bin/sh
set -ex

cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen 80;
    server_name _;
    return 301 "$REDIRECT_URL";
}
EOF
exec nginx -g 'daemon off;'
