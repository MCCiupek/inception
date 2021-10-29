#! /bin/sh

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp config create --dbname="$WP_DB_NAME" \
    --dbuser="$WP_USER" \
    --dbpass="$WP_USER_PASSWORD" \
    --dbhost="$WP_DB_HOST" \
    --path=/var/www/ \
    --dbprefix="$WP_TABLE_PREFIX"

echo "Starting Nginx..."
nginx -g "daemon off;"