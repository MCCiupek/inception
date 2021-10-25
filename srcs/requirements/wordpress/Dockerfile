#
# Wordpress Dockerfile
#

# Pull base image.
FROM debian:buster

#LABEL maintainer="mciupek <mciupek@student.42.fr>"

RUN apt-get update && apt-get -y upgrade

# install php
RUN apt-get install -y \
    php7.3 \
    php-fpm \
    php-mysql \
    tar

RUN rm -rf *.tar.gz
ADD https://wordpress.org/latest.tar.gz /var/www/
RUN cd /var/www && tar -xzvf *.tar.gz

RUN rm -f /var/www/wordpress/wp-config-sample.php
COPY ./conf/wp-config.php /var/www/wordpress/

# Define working directory
# WORKDIR /var/www/

# # Copy config file
# COPY . .

# #COPY ./conf/www.conf /var/www/www.conf
# COPY ./conf /var/www/
# RUN chmod 777 /var/www/www.conf

# Create the folder to enable php start
RUN mkdir -p /run/php

# Launch wordpress installation
# COPY ./tools/start.sh /usr/local/bin/
# RUN chmod 777 /usr/local/bin/start.sh

# #ENTRYPOINT ["start.sh"]
# CMD ["start.sh"]

# Expose ports
EXPOSE 9000

# Define default command
#CMD ["bash", "/wp_start.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]