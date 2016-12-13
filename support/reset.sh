#!/bin/bash

#
#   This script resets the repository so support/new-project.sh
#   can be cleanly run.  If the 'hard' argument is passed, it also
#   deletes NPM and Composer dependencies.
#

source .env
vagrant destroy -f
heroku apps:delete $SHORT_NAME --confirm $SHORT_NAME
rm db.sh
if [[ $2 == 'hard' ]]
then
    rm -rf node_modules
    rm -rf vendor
fi
