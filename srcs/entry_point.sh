#delete any existing user with the user name mysql and creates a new user with uid 999
sudo userdel mysql
sudo useradd -u 999 mysql

#set the owner of the directory/data/mysql in the host machine.
sudo mkdir -p /data/mysql
sudo chown -R mysql:mysql /data/mysql

#delete any existing user with the user name www-data and creates a new user with uid 82
sudo userdel www-data
sudo useradd -u 82 www-data

#set the owner of the directory/data/html in the host machine
sudo mkdir -p /data/html
sudo chown -R www-data:www-data /data/html
