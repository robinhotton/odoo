#!/bin/bash

# Arrêter et supprimer les conteneurs Docker
sudo docker compose down
sudo docker volume rm -f odoo_odoo-db-data # supprimer le volume de la bdd postgres
sudo docker volume prune -f # supprimer les volumes anonyme inutilisés

# Supprimer les fichiers du dossier odoo-web-data s'il existe
ODOO_WEB_DATA_DIR="./odoo-web-data"
ODOO_WEB_DATA="$ODOO_WEB_DATA_DIR/*"
if [ -d "$ODOO_WEB_DATA_DIR" ]; then
    sudo rm -rf $ODOO_WEB_DATA
fi
