#!/bin/bash

#
# This script completes the WordPress installation process.
#

cd /app

source site-name.txt
wp=/app/vendor/wp-cli/wp-cli/bin/wp

echo "Applying wp-config.php..."
cp install/wp-config.php vendor/wordpress/wp-config.php

echo "Installing WordPress..."
cd vendor/wordpress
$wp core install \
    --url="localhost" \
    --title="$SITE_NAME" \
    --admin_user="Cody" \
    --admin_password="codys-password" \
    --admin_email="cody@leftgoat.com" \
    --skip-email

echo "Activating Advanced Custom Fields and Amazon S3 offloading..."
$wp plugin activate --all

echo "Activating JSON theme..."
$wp theme activate wp-json

echo "Setting Permalink structure..."
$wp rewrite structure '/%postname%'
