#!/bin/bash

#
# This script starts the Heroku server.
#

# set working directory
cd /app

# Install & configure WordPress if necessary
install/install-wp.sh

# start nginx server and wait for it to boot
vendor/bin/heroku-php-nginx -C install/heroku/nginx.conf -p 8000 -v vendor/wordpress &
echo "Waiting for nginx to start up..."
sleep 10
echo "Assuming nginx is started."

# start Node server
node main.js
