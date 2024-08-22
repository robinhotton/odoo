#!/bin/bash

docker compose down # Stop and remove the project's containers
docker volume prune -f # Remove unused volumes
docker network prune -f # Remove unused networks

# Remove files from the odoo-web-data directory if it exists
ODOO_WEB_DATA_DIR="./odoo-web-data"
ODOO_WEB_DATA="$ODOO_WEB_DATA_DIR/*"
if [ -d "$ODOO_WEB_DATA_DIR" ]; then
    rm -rf $ODOO_WEB_DATA
fi
