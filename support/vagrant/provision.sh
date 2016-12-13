#!/bin/bash

#
#   This script sets up the local Vagrant box.
#

set -e
cd /app
source .env

#   Adds repositories and updates cache
echo -e "\n>>> Adding repositories and updating cache..."
sudo add-apt-repository ppa:ondrej/php
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

#   Installs MySQL
echo -e "\n>>> Installing MySQL..."
export DEBIAN_FRONTEND="noninteractive"
sudo -E apt-get install -y mysql-server-5.6

#   Sets up MySQL database
echo -e "\n>>> Setting up MySQL database..."
echo "CREATE USER 'local'@'localhost' IDENTIFIED BY 'local'" | mysql -u root
echo "CREATE DATABASE wordpress" | mysql -u root 
echo "GRANT ALL ON wordpress.* TO 'local'@'localhost'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

#   Installs PHP
echo -e "\n>>> Installing PHP 7.1..."
sudo apt-get install -y php7.1-fpm php7.1-mysql php7.1-zip php7.1-curl

#   Installs Composer
echo -e "\n>>> Installing Composer..."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

#   Installs Composer dependencies
echo -e "\n>>> Installing Composer dependencies..."
composer install --prefer-dist

#   Sets up local WordPress installation
echo -e "\n>>> Setting up local WordPress database..."
wp=/app/vendor/bin/wp
cd vendor/wordpress
$wp core install --url="localhost" --title="$FULL_NAME" --admin_user="$WP_ADMIN_USERNAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="cody@leftgoat.com" --skip-email
$wp plugin activate --all
$wp theme activate wp-json
cd /app

#   Installs Node.js
echo -e "\n>>> Installing Node.js..."
sudo apt-get install -y nodejs

#   Installs NPM dependencies
echo -e "\n>>> Installing NPM dependencies..."
npm install
sudo npm install -g nodemon

#   Installs and configures nginx
echo -e "\n>>> Installing and configuring nginx..."
sudo apt-get install -y nginx
sudo cp -f support/vagrant/nginx.conf /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
sudo service nginx restart

echo -e "\n\nProvisioning Vagrant box finished!"
