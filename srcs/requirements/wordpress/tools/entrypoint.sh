#!/bin/sh

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp core download --path=/var/www --locale=fr_FR
wp config create --dbname="$WP_DB_NAME" --dbuser="$WP_USER" --dbpass="$WP_USER_PASSWORD" --dbhost="$WP_DB_HOST" --path=/var/www/ --dbprefix="$WP_TABLE_PREFIX"
wp core install --url="$DOMAIN_NAME" --title="$WP_NAME" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN@email.com" --path=/var/www/
wp user create $WP_USER $WP_USER@email.com --role="author" --user_pass="$WP_USER_PASSWORD" --path="/var/www"

echo "Starting php-fpm7.3..."
/usr/sbin/php-fpm7.3 -F