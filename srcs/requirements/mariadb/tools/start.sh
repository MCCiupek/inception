#!/bin/sh

service mysql start
sleep 10
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`"
mysql -e "CREATE USER IF NOT EXISTS \`${WORDPRESS_DB_USER}\`@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO \`${WORDPRESS_ROOT_USER}\`@'%' IDENTIFIED BY '${WORDPRESS_ROOT_PASSWORD}'"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${WORDPRESS_DB_USER}\`@'%'"
mysql -e "FLUSH PRIVILEGES"

service mysql stop

exec mysqld -u root --datadir="/var/lib/mysql"