#!/bin/bash

#
# This script sets up a new Heroku and Vagrant project from
# the template.
#
# Usage:
# $ support/new-project.sh <short-name> "<Full Name>"
#
# Requirements:
# - Heroku toolbelt must be installed
# - Short name must be a valid, unused Heroku app name
#

set -e
cd "$(dirname "$0")/.."
echo "NODE_ENV=\"development\"" > .env

#   Checks for required parameters
[[ "$1" ]] && SHORT_NAME="$1" || (echo "Don't forget a short name!"; exit 1)
[[ "$2" ]] && FULL_NAME="$2" || (echo "Don't forget a full name!"; exit 1)
echo -e "\nCreating site $FULL_NAME ($SHORT_NAME)\n----------------"

#   Creates some random strings for setup
WP_ADMIN_USERNAME="$(openssl rand -base64 18 | head -c 16)"
WP_ADMIN_PASSWORD="$(openssl rand -base64 18 | head -c 16)"
echo "WordPress admin username: $WP_ADMIN_USERNAME"
echo "WordPress admin password: $WP_ADMIN_PASSWORD"

#   Starts Vagrant box
echo -e "----------------\nSetting up local installation..."
echo "SHORT_NAME=\"$SHORT_NAME\"" >> .env
echo "FULL_NAME=\"$FULL_NAME\"" >> .env
echo "WP_ADMIN_USERNAME=\"$WP_ADMIN_USERNAME\"" >> .env
echo "WP_ADMIN_PASSWORD=\"$WP_ADMIN_PASSWORD\"" >> .env
vagrant destroy -f
vagrant up

# Create new app
heroku apps:create "$SHORT_NAME"

# Add buildpacks
heroku buildpacks:add --index 1 heroku/php
heroku buildpacks:add --index 2 heroku/nodejs

# Add add-ons
heroku addons:create --as "wp_database" jawsdb:kitefin

# Push to Heroku
git checkout -b master
git push heroku master