#!/bin/sh
set -ex

if [ "$PRESERVE_PATH" != "True" ]; then
  target="${REDIRECT_URL}"
else
  target="${REDIRECT_URL}\$request_uri"
fi

cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen 80;
    server_name _;
    return 301 "$target";
}
EOF
exec nginx -g 'daemon off;'
