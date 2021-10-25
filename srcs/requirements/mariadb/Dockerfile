#
# MariaDB Dockerfile
#

# Pull base image
FROM debian:buster

# update the software repository
RUN 		apt-get update && apt-get -y upgrade

# install maria-db (database)
RUN 		apt-get install -y mariadb-server

# purge and re-create /var/lib/mysql with correct ownership
# RUN \
#   rm -rf /var/lib/apt/lists/* \
#   && mkdir -p /var/run/mysqld \
#   && chown -R mysql:mysql /var/run/mysqld \
#   && chmod 777 /var/run/mysqld

RUN \
  rm -rf /var/lib/apt/lists/* \
  && mkdir -p /var/lib/mysqld \
  && chown -R mysql:mysql /var/lib/mysqld \
  && chmod 777 /var/lib/mysqld

# Copy config files
COPY		./tools/create_db.sh /usr/local/bin/
#COPY		./tools/start.sh /start.sh
RUN			chmod +rw /usr/local/bin/create_db.sh

COPY    ./conf/db.sql /usr/local/bin/
COPY		./conf/my.cnf /etc/mysql/my.cnf
RUN			chmod +x /usr/local/bin/db.sql

RUN			chmod 777 /usr/local/bin/create_db.sh

RUN			chmod -R 755 /var/lib/mysql/

# Start server
ENTRYPOINT	["/usr/local/bin/create_db.sh"]

# Launch mariadb
CMD ["mysqld", "--bind-address=0.0.0.0"]

# Expose ports
EXPOSE 3306