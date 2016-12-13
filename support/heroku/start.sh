#!/bin/bash

#
# This script starts the Heroku server.
#

vendor/bin/heroku-php-nginx -C support/heroku/nginx.conf -p 8000 -v vendor/wordpress | {
    while IFS= read -r line
    do
        if [[ $line == 'Application ready for connections on port 8000.' ]]
        then
            node main.js
            break
        fi
    done
}