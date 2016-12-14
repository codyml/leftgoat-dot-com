#!/bin/bash

#
#   This script sets up the local Vagrant box.
#

set -e
cd /app

#   Adds repositories and updates cache
echo -e "\n>>> Adding repositories and updating cache..."
sudo add-apt-repository ppa:ondrej/php
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

#   Creates various random strings for WordPress installation
echo -e "\n>>> Creating various random strings for WordPress installation..."
sudo apt-get install -y pwgen
echo "WP_ADMIN_USERNAME=\"$(pwgen -s 16 1)\"" >> .env
echo "WP_ADMIN_PASSWORD=\"$(pwgen -s 16 1)\"" >> .env
echo "WP_AUTH_KEY=\"$(pwgen -s 64 1)\"" >> .env
echo "WP_SECURE_AUTH_KEY=\"$(pwgen -s 64 1)\"" >> .env
echo "WP_LOGGED_IN_KEY=\"$(pwgen -s 64 1)\"" >> .env
echo "WP_NONCE_KEY=\"$(pwgen -s 64 1)\"" >> .env
echo "WP_AUTH_SALT=\"$(pwgen -s 64 1)\"" >> .env
echo "WP_SECURE_AUTH_SALT=\"$(pwgen -s 64 1)\"" >> .env
echo "WP_LOGGED_IN_SALT=\"$(pwgen -s 64 1)\"" >> .env
echo "WP_NONCE_SALT=\"$(pwgen -s 64 1)\"" >> .env
source .env

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
WP_DATABASE_URL="mysql://local:local@localhost:3306/wordpress"
echo "WP_DATABASE_URL=\"$WP_DATABASE_URL\"" >> .env

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
chmod -R 777 vendor/wordpress

#   Sets up local WordPress installation
echo -e "\n>>> Setting up local WordPress database..."
wp=/app/vendor/bin/wp
cd vendor/wordpress
$wp core install --url="localhost" --title="$FULL_NAME" --admin_user="$WP_ADMIN_USERNAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="cody@leftgoat.com" --skip-email
$wp plugin activate --all
$wp theme activate wp-json
$wp rewrite structure "/%postname%/"
cd /app

#   Installs Node.js
echo -e "\n>>> Installing Node.js..."
sudo apt-get install -y nodejs

#   Installs NPM dependencies
echo -e "\n>>> Installing NPM dependencies..."
npm install

#   Installs and configures nginx
echo -e "\n>>> Installing and configuring nginx..."
sudo apt-get install -y nginx
sudo cp -f support/vagrant/nginx.conf /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
sudo service nginx restart

#   Creates a self-signed certificate for SSL
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=XX/ST=XX/L=XX/O=XX/CN=${SHORT_NAME}.dev" \
    -keyout dev-ssl.key -out dev-ssl.cert

echo -e "\n\nProvisioning Vagrant box finished!"
