#
# MariaDB Dockerfile
#

# Pull base image
FROM debian:buster

# update the software repository
RUN 		apt-get update && apt-get -y upgrade

# install maria-db (database)
RUN 		apt-get install -y \
  mariadb-server \
  mariadb-client

# COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/
# COPY ./conf/mariadb.sql /

# RUN service mysql start && mysql < mariadb.sql
# RUN rm -f mariadb.sql

COPY tools/create_db.sh /bin/
COPY conf/my.cnf /etc/mysql/my.cnf

RUN chmod 775 /bin/create_db.sh
RUN chmod 775 /etc/mysql/my.cnf
RUN chmod -R 775 /var/lib/mysql

ENTRYPOINT [ "bin/create_db.sh" ]
# CMD ["mysqld", "--bind-address=0.0.0.0"]

# purge and re-create /var/lib/mysql with correct ownership
# RUN \
#   rm -rf /var/lib/apt/lists/* \
#   && mkdir -p /var/run/mysqld \
#   && chown -R mysql:mysql /var/run/mysqld \
#   && chmod 777 /var/run/mysqld

# Copy config files
# COPY		./tools/create_db.sh /usr/local/bin/
# RUN			chmod +rw /usr/local/bin/create_db.sh

# COPY    ./conf/db.sql /usr/local/bin/
# RUN			chmod +x /usr/local/bin/db.sql

# Start server
# ENTRYPOINT	["create_db.sh"]

# Launch mariadb
# CMD ["mysqld", "--bind-address=0.0.0.0"]

# Expose ports
EXPOSE 3306