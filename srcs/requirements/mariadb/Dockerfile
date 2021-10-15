#
# MariaDB Dockerfile
#

# Pull base image
FROM debian:buster

# update the software repository
RUN 		apt-get update && apt-get -y upgrade

# install maria-db (database)
RUN 		apt-get install -y mariadb-server

# Copy config files
COPY		./tools/start.sh /start.sh
RUN			chmod +x /start.sh
COPY		./conf/my.cnf /etc/mysql/my.cnf
RUN			chmod +rw /etc/mysql/my.cnf

# Start server
ENTRYPOINT	["/start.sh"]

# Expose ports
EXPOSE 3306