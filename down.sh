#!/bin/bash

sudo docker compose down # Stop and remove the project's containers
sudo docker volume prune -f # Remove unused volumes
sudo docker networks prune -f # Remove unused networks

# Remove files from the odoo-web-data directory if it exists
ODOO_WEB_DATA_DIR="./odoo-web-data"
ODOO_WEB_DATA="$ODOO_WEB_DATA_DIR/*"
if [ -d "$ODOO_WEB_DATA_DIR" ]; then
    sudo rm -rf $ODOO_WEB_DATA
fi
