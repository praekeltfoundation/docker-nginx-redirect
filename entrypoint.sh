#!/bin/sh
set -ex

cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen 80;
    server_name _;
    if ($PRESERVE_PATH != "True")
      {
        return 301 "$REDIRECT_URL";
      }
    if ($PRESERVE_PATH == "True")
      {
        return 301 "$REDIRECT_URL$request_uri";
      }
}
EOF
exec nginx -g 'daemon off;'
