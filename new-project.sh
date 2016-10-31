#!/bin/bash

#
# This script sets up a new Heroku and Vagrant project from
# the template.
#
# Usage:
# $ cd root-directory
# $ ./new-project.sh <short-name> <Full Name>
#
# Requirements:
# - Heroku toolbelt must be installed
# - Composer must be installed
# - Short name must be alphanumeric plus hyphens
#

cd "$(dirname "$0")"

if [ -z "$1" ]
then
	echo "Don't forget a short name!"
	exit 1
fi

if [ -z "$2" ]
then
	echo "Don't forget a full name!"
	exit 1
fi

# Start a new branch for the site
git branch -m core
git remote rename origin core
git checkout -b master

# Save long name
echo "SITE_NAME=\"$2\"" > site-name.txt || { echo "There was an error!"; exit 1; }

# Set up Vagrant machine
vagrant up || { echo "There was an error!"; exit 1; }

# Create new app
heroku apps:create "$1" || { echo "There was an error!"; exit 1; }

# Add buildpacks
heroku buildpacks:add --index 1 heroku/php || { echo "There was an error!"; exit 1; }
heroku buildpacks:add --index 2 heroku/nodejs || { echo "There was an error!"; exit 1; }

# Add add-ons
heroku addons:create --as "wp_database" jawsdb:kitefin || { echo "There was an error!"; exit 1; }

# Push to Heroku
git add site-name.txt || { echo "There was an error!"; exit 1; }
git commit -m "Recorded site name." || { echo "There was an error!"; exit 1; }
git push heroku master || { echo "There was an error!"; exit 1; }
