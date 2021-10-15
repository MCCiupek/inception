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

# Copy config file
COPY ./conf/www.conf /var/www/html/

# Create the folder to enable php start
RUN mkdir -p /run/php

# Launch wordpress installation
COPY ./tools/start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]

# Expose ports
EXPOSE 9000

# Define working directory
WORKDIR /var/www/

# Define default command
#CMD ["bash", "/wp_start.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]