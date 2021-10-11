CREATE DATABASE '${MYSQL_DATABASE}';
CREATE USER '${MYSQL_USER}'@'%';
SET password FOR '${MYSQL_USER}'@'%' = password('${MYSQL_PASSWORD}');
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
update mysql.user set plugin=' ' where user='root';
FLUSH PRIVILEGES;
