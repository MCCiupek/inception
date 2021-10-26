#
# Nginx Dockerfile
#

# Pull base image.
FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

# update the software repository
RUN		apt-get update && apt-get -y upgrade

# install nginx
RUN		apt-get install -y \
            nginx \
            openssl

# nginx config
RUN		mkdir -p /run/nginx
COPY    conf/nginx.conf /etc/nginx/conf.d/default.conf
# RUN		rm -rf /etc/nginx/nginx.conf
# COPY	conf/nginx.conf /etc/nginx/sites-available/site.conf
#RUN		ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
RUN		chown -R www-data:www-data /var/www

# SSL certificates creation
RUN 	openssl req -x509 -nodes -days 1 -newkey rsa:2048 		\
		-subj "/C=FR/ST=FRANCE/L=PARIS/O=INCEPTION/CN=mciupek.42.fr" \
		-keyout etc/ssl/private/nginx-cert.key					\
		-out etc/ssl/certs/nginx-cert.crt

# start nginx
COPY 	./tools/entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "sh", "entrypoint.sh"]
# CMD [ "nginx", "-g", "daemon off;" ]

# Expose ports
EXPOSE 443