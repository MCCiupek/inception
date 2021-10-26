#
# Wordpress Dockerfile
#

# Pull base image.
FROM        debian:buster

#LABEL maintainer="mciupek <mciupek@student.42.fr>"

RUN         apt-get update && apt-get -y upgrade

# install php
RUN         apt-get install -y \
                php7.3 \
                php-fpm \
                php-mysql \
                tar \
                wget

# install wordpress
# RUN         rm -rf /var/www/*.tar.gz
# ADD         https://wordpress.org/latest.tar.gz /var/www/
# RUN         cd /var/www && tar -xzvf *.tar.gz
# RUN         rm -rf /var/www/*.tar.gz
COPY        ./tools/install_wp.sh /install_wp.sh
CMD         [ "bash", "/install_wp.sh" ]

# Copy config file
# RUN         rm -f /var/www/wordpress/wp-config-sample.php
RUN         chmod -R /var/www/wordpress
COPY        ./conf/wp-config.php /var/www/wordpress/wp-config.php
COPY		./conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Create the folder to enable php start
RUN         mkdir -p /run/php
RUN			mkdir /var/log/php-fpm 

# Expose ports
EXPOSE      9000

# Define default command
COPY        ./tools/entrypoint.sh /entrypoint.sh
ENTRYPOINT  [ "bash", "/entrypoint.sh" ]
#CMD ["/usr/sbin/php-fpm7.3", "-F"]