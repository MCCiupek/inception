#!/bin/bash

echo "Database initialization"

mysqld_safe &
sleep 2

echo "wait 15s"
sleep 15

echo "ajout de la db"

echo "------ touch socket -------"
touch /var/run/mysqld/mysqld.sock
chmod -R 775 /var/run/mysqld/mysqld.sock
echo "----------------"

sleep 2
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS ${WP_USER}@'%' IDENTIFIED BY '${WP_USER_PASSWORD}';"
mysql -e "CREATE USER IF NOT EXISTS ${WP_ADMIN}@'%' IDENTIFIED BY '${WP_ADMIN_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO ${WP_ADMIN}@'%' IDENTIFIED BY '${WP_ADMIN_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${WP_USER}@'%';"
mysql -e "FLUSH PRIVILEGES;"

echo "database shutdown"
sleep 2
mysqladmin shutdown

echo "database restarting"
sleep 2

exec mysqld -u root