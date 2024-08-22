#!/bin/bash

# Check if an argument has been provided
if [ -z "$1" ]; then
    echo "Error: No module name provided."
    exit 1
fi

# Get the current username
USERNAME=$(whoami)

# Function to convert CamelCase to snake_case
camel_to_snake() {
    echo "$1" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//'
}

# Convert to snake_case
module_name=$(camel_to_snake "$1")

# Execute the 'odoo scaffold' command in the Docker container
docker exec -it odoo-web-1 odoo scaffold "$1" /mnt/extra-addons

# Change the owner of the module directory
sudo chown -R "$USERNAME:$USERNAME" "./addons-custom/$module_name"

# Change the permissions of the module directory
sudo chmod -R 777 "./addons-custom/$module_name"

echo "Module $module_name has been created and permissions have been updated."
