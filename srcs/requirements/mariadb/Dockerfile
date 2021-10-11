#
# MariaDB Dockerfile
#

# Pull base image.
# FROM dockerfile/ubuntu
FROM debian

COPY ./tools/db.sql /tmp/

# Install MariaDB.
RUN \
  apt-get update -y && \
  apt-get install -y --no-install-recommends gnupg && \
#  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xcbcb082a1bb943db && \
#  echo "deb http://mariadb.mirror.iweb.com/repo/10.0/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/mariadb.list && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf
RUN echo "mysqld_safe &" > /tmp/config
RUN echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config
#RUN echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION; FLUSH PRIVILEGES;'" >> /tmp/config
#RUN sh tools/config.sh
RUN echo "mysql -e '" >> /tmp/config
RUN cat /tmp/db.sql >> /tmp/config
RUN echo "'" >> /tmp/config
RUN bash /tmp/config
RUN rm -f /tmp/config

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["mysqld_safe"]

# Expose ports.
EXPOSE 3306
