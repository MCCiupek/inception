#!/bin/sh
cd /var/www/

if [ -f ./wordpress/wp-config.php ]
then
	echo "Wordpress is already downloaded"
else

	#Download wordpress
    echo "Install Wordpress"
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm -rf latest.tar.gz

fi

exec "$@"