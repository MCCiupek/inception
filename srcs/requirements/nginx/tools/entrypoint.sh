#! /bin/sh
echo "Starting Nginx..."
nginx -g "daemon off;"
tail -f /var/log/nginx/error.log