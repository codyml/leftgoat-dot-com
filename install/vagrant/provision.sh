#!/bin/bash

#
# This script sets up the Vagrant sever.
#

# change to app directory
cd /app

# setup apt-get, load repositories
apt-get install -y python-software-properties
add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty multiverse'
add-apt-repository -y ppa:ondrej/php
apt-get update

# install and configure nginx
apt-get install -y nginx
ufw allow 'Nginx HTTP'
cp -f install/vagrant/nginx.conf /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
service nginx restart

# install and configure mysql
DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-5.6
cp -f install/vagrant/my.cnf /etc/mysql/my.cnf
service mysql restart
echo "CREATE USER 'wp-username'@'localhost' IDENTIFIED BY 'wp-password'" | mysql -u root
echo "CREATE DATABASE wordpress" | mysql -u root 
echo "GRANT ALL ON wordpress.* TO 'wp-username'@'localhost'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

# install and configure php
apt-get install -y php-fpm php-mysql php-zip
cp -f install/vagrant/php.ini /etc/php/7.0/fpm/php.ini
service php7.0-fpm restart

# install & run composer to download wordpress-cli
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
mv composer.phar /usr/local/bin/composer
php -r "unlink('composer-setup.php');"
composer install

# install node
curl -sL https://deb.nodesource.com/setup_4.x | bash -
apt-get install -y nodejs
npm i