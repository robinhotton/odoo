#!/bin/bash

# Define variables
CONFIG_DIR="config"
ADDONS_CUSTOM_DIR="addons-custom"
ADDONS_ODOO_DIR="addons-odoo"
ODOO_DATA_DIR="odoo-web-data"

# Move the configuration file to the configuration directory if it exists
if [ -f "odoo.conf" ]; then
    ODOO_CONF="$CONFIG_DIR/odoo.conf"
    mv -f odoo.conf $CONFIG_DIR/ # -f forces overwrite

    # Create necessary directories if they don't exist
    mkdir -p $CONFIG_DIR $ADDONS_CUSTOM_DIR $ADDONS_ODOO_DIR $ODOO_DATA_DIR # -p prevents error if the directory already exists

    # Add permissions
    chmod -R 777 .
fi

# Launch Docker containers
docker compose up
