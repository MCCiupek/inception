#!/bin/bash

echo "Database initialization"

mysqld &

if ! mysqladmin --wait=30 ping; then
	printf "Could not ping mariadb for 30 seconds, runtime configuration is not possible.\n"
	exit 1
fi

echo "Building database"

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS ${WP_USER}@'%' IDENTIFIED BY '${WP_USER_PASSWORD}';"
# mysql -e "CREATE USER IF NOT EXISTS ${WP_ADMIN}@'%' IDENTIFIED BY '${WP_ADMIN_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO ${WP_ADMIN}@'%' IDENTIFIED BY '${WP_ADMIN_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${WP_USER}@'%';"
mysql -e "INSERT INTO wordpress.wp_users 
(user_login,user_pass,user_nicename,user_email,user_url,user_registered,user_activation_key,user_status,display_name) 
VALUES ('${WP_USER}'@'%',MD5('${WP_USER_PASSWORD}'),'${WP_USER}','${WP_USER}@42.fr','https://${DOMAIN_NAME}','2021-10-27','',0,'${WP_USER}');"
mysql -e "FLUSH PRIVILEGES;"

echo "Database shutdown"
mysqladmin shutdown

echo "Restarting database"
exec mysqld -u root