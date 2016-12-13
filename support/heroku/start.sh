#!/bin/bash

#
#   This script starts the Heroku server.
#

vendor/bin/heroku-php-nginx -C support/heroku/nginx.conf -p 8000 -v vendor/wordpress &
node main.js
