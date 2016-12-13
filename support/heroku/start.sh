#!/bin/bash

#
# This script starts the Heroku server.
#

if vendor/bin/heroku-php-nginx -C support/heroku/nginx.conf -p 8000 -v vendor/wordpress | grep -q 'Application ready for connections on port 8000.'; then
    node main.js
fi

