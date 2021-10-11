CREATE DATABASE ${MYSQL_DATABASE};
CREATE USER ${MYSQL_USER}@'localhost';
SET password FOR ${MYSQL_USER}@'localhost' = password(${MYSQL_PASSWORD});
GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_USER}@'localhost' IDENTIFIED BY ${MYSQL_PASSWORD};
update mysql.user set plugin=' ' where user='root';
FLUSH PRIVILEGES;
