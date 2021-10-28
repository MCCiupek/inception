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

# purge and re-create /var/lib/mysql with correct ownership
RUN \
        rm -rf /var/lib/apt/lists/* \
        && mkdir -p /var/run/mysqld \
        && chown -R mysql:mysql /var/run/mysqld \
        && chmod 777 /var/run/mysqld

# Copy config files
COPY    tools/create_db.sh /bin/
COPY    conf/my.cnf /etc/mysql/my.cnf
RUN     rm -rf /etc/my.cnf ~/.my.cnf

RUN     chmod 775 /bin/create_db.sh
RUN     chmod 775 /etc/mysql/my.cnf
RUN     chmod -R 775 /var/lib/mysql

# Start server
ENTRYPOINT [ "bin/create_db.sh" ]
# CMD ["mysqld", "--bind-address=0.0.0.0"]

# Expose ports
EXPOSE 3306