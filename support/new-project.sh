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
echo -e "\nCreating project $FULL_NAME ($SHORT_NAME)\n----------------"
echo "SHORT_NAME=\"$SHORT_NAME\"" >> .env
echo "FULL_NAME=\"$FULL_NAME\"" >> .env

#   Starts Vagrant box
echo -e "\nSetting up local installation..."
vagrant destroy -f
vagrant up

#   Creates new Heroku app with buildpacks and addons
echo -e "\nCreating new Heroku app with buildpacks and addons..."
heroku apps:create "$SHORT_NAME"
heroku buildpacks:add --index 1 heroku/php
heroku buildpacks:add --index 2 heroku/nodejs
heroku addons:create --as "wp_database" jawsdb:kitefin
echo "REMOTE_DB_URL=\"$(heroku config:get WP_DATABASE_URL)\"" >> .env

#   Requests AWS credentials and saves them as environment
#   variables, locally and on Heroku
echo -e "\nSaving AWS credentials..."
echo "Enter your AWS Access Key ID:"
read AWS_ACCESS_KEY_ID
echo "AWS_ACCESS_KEY_ID=\"$AWS_ACCESS_KEY_ID\"" >> .env
heroku config:set AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
echo "Enter your AWS Secret Access Key:"
read AWS_SECRET_ACCESS_KEY
echo "AWS_SECRET_ACCESS_KEY=\"$AWS_SECRET_ACCESS_KEY\"" >> .env
heroku config:set AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

#   Copies database upload/download resources
echo -e "\nCreating database manipulation script (./db.sh)..."
cp -f "support/wordpress/db.sh" "db.sh"

#   Displays next steps
cat <<EOF
>
>   Project setup complete!  If you ssh into the vagrant box and
>   run 'cd /app && sudo node main.js', you should see a sample
>   page served from the local WordPress installation.
>
>   Next steps:
>   - Visit the WordPress admin panel and enter the appropriate
>     S3 bucket name.
>   - Modify ./db.sh with remote database credentials, then use
>     the script to save your local database values and upload them
>     to the remote database.
>   - Push your code to Heroku, either with the Heroku CLI or by
>     setting up a GitHub hook.
>
>   That's it!
>
EOF

git checkout -b master
