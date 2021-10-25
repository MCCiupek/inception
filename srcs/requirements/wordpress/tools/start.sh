#!/bin/sh

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	#Download wordpress
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm -rf latest.tar.gz
    #mkdir /var/www
    mv -f wordpress /var/www/
    chmod 755 -R /var/www/wordpress
    chown -R www-data:www-data /var/www/wordpress

	#Update configuration file
    rm -rf /var/www/wordpress/wp-config-sample.php
    mv ../conf/wp-config.php /var/www/wordpress

	rm -rf /etc/php/7.3/fpm/pool.d/www.conf
	mv ../conf/www.conf /etc/php/7.3/fpm/pool.d/

	#Inport env variables in the config file
	cd /var/www/wordpress
	sed -i "s/username_here/$WP_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WP_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$WP_DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$WP_DB_NAME/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php
fi

exec "$@"