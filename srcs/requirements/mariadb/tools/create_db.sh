#!/bin/bash

echo "Database initialization"

mysqld &

if ! mysqladmin --wait=30 ping; then
	printf "Could not ping mariadb for 30 seconds, runtime configuration is not possible.\n"
	exit 1
fi

echo "Building database"
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
CREATE USER ${MARIADB_USER}@'%' IDENTIFIED by '${MARIADB_PASSWORD}';
CREATE DATABASE $MARIADB_DATABASE;
GRANT ALL PRIVILEGES ON "${MARIADB_DATABASE}.*" TO "${MARIADB_USER}"@'%';
FLUSH PRIVILEGES;

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER ${WP_USER}@'%' IDENTIFIED BY '${WP_USER_PASSWORD}';"
# mysql -e "CREATE USER IF NOT EXISTS ${WP_ADMIN}@'%' IDENTIFIED BY '${WP_ADMIN_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO ${WP_ADMIN}@'%' IDENTIFIED BY '${WP_ADMIN_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${WP_USER}@'%';"
mysql -e "FLUSH PRIVILEGES;"

echo "Database shutdown"
mysqladmin shutdown

echo "Restarting database"
exec mysqld -u root