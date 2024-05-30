#!/bin/bash

# Get the current username
USERNAME=$(whoami)

# Check if an argument has been provided
if [ -z "$1" ]; then
    echo "Error: No module name provided."
    exit 1
fi

# Execute the 'odoo scaffold' command in the Docker container
docker exec -it odoo-web-1 odoo scaffold $1 /mnt/extra-addons

# Change the owner of the module directory
sudo chown -R $USERNAME:$USERNAME ./addons-tecken/$1

# Change the permissions of the module directory
sudo chmod -R 777 ./addons-tecken/$1

echo "Module $1 has been created and permissions have been updated."
