#!/bin/bash

#
# This script starts the server on Vagrant.
#

# set working directory
cd /app

# check that WordPress has been installed and install if necessary
install/install-wp.sh

# run node
sudo node main.js > /dev/null &
echo "Started Node!"