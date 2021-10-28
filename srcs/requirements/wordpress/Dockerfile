#
# Wordpress Dockerfile
#

# Pull base image.
FROM        debian:buster

# update the software repository
RUN         apt-get update && apt-get -y upgrade

# install php
RUN         apt-get install -y \
                php7.3 \
                php-fpm \
                php-mysql \
                mariadb-client \
                tar \
                wget

# install wordpress
COPY        ./tools/install_wp.sh /install_wp.sh
CMD         [ "bash", "/install_wp.sh" ]

# Copy config file
COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Create the folder to enable php start
RUN         mkdir -p /run/php
RUN			mkdir /var/log/php-fpm 

# Expose ports
EXPOSE      9000

# Define default command
COPY        ./tools/entrypoint.sh /entrypoint.sh
ENTRYPOINT  [ "bash", "/entrypoint.sh" ]