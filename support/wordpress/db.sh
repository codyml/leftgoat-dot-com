#!/bin/bash

#
#   This script allows you to save and apply the local and remote
#   databases.  Meant to be run from inside the vagrant box.
#
#   Usage:
#   - db.sh save [<filename>]: saves the local database to file
#   - db.sh apply <filename>: applies a file to the local database
#   - db.sh download [<filename>]: downloads the remote database to file
#   - db.sh upload <filename>: uploads a file to the remote database
#

set -e
source .env

case $1 in

    #   Saves the local database to file
    "save")
        if [[ $2 ]]
        then
            FILENAME="$2"
        else
            FILENAME="db-local-$(date +"%Y-%m-%d-%H-%M-%S").sql"
        fi
        mysqldump -h localhost -P 3306 -u local -plocal wordpress > "$FILENAME"
        echo "$FILENAME"
        ;;

    #   Applies a database file to the local database
    "apply")
        if [[ $2 ]]
        then
            FILENAME="$2"
        else
            echo "No filename supplied!"
            exit 1
        fi
        mysql -h localhost -P 3306 -u local -plocal wordpress < "$FILENAME"
        echo "$FILENAME successfully applied to local database."
        ;;

    #   Downloads the remote database to file
    "download")
        if [[ $2 ]]
        then
            FILENAME="$2"
        else
            FILENAME="db-remote-$(date +"%Y-%m-%d-%H-%M-%S").sql"
        fi
        # mysqldump -h <host> -P <port> -u <username> -p<password> <database> > "$FILENAME"
        echo "Edit this script to include remote MySQL server."
        echo "$FILENAME"
        ;;

    #   Uploads a file to the remote database
    "upload")
        if [[ $2 ]]
        then
            FILENAME="$2"
        else
            echo "No filename supplied!"
            exit 1
        fi
        # mysql -h <host> -P <port> -u <username> -p<password> <database> < "$FILENAME"
        echo "Edit this script to include remote MySQL server."
        ;;

esac
