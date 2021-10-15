#
# Wordpress Dockerfile
#

# Pull base image.
FROM debian:buster

#LABEL maintainer="mciupek <mciupek@student.42.fr>"

RUN apt-get update && apt-get -y upgrade

# install php
RUN apt-get install -y \
    php-fpm \
    php-mysql \
    tar

# install wordpress
ADD https://wordpress.org/latest.tar.gz /tmp/latest.tar.gz

RUN 	cd /tmp \
		&& tar xzvf latest.tar.gz \
		&& rm latest.tar.gz \
		&& mkdir /var/www \
		&& mv -f wordpress /var/www/ \
		&& chmod 755 -R /var/www/wordpress \
		&& chown -R www-data:www-data /var/www/wordpress

RUN 	rm -rf /var/www/wordpress/wp-config-sample.php

COPY	./conf/wp-config.php /var/www/wordpress
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY 	./tools/start.sh /wp_start.sh

RUN 	chmod +x /wp_start.sh
RUN 	sed -i "/listen =/d" /etc/php/7.3/fpm/pool.d/www.conf
RUN 	echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN 	mkdir -p /run/php/

ENTRYPOINT ["/wp_start.sh"]

# Expose ports
EXPOSE 9000

# Define default command
CMD ["bash", "/wp_start.sh"]