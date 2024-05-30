#!/bin/bash

sudo docker compose down # Arrêter et supprimer les conteneurs du projet
sudo docker volume prune -f # supprimer les volumes inutilisés
sudo docker networks prune -f # supprimer les networks inutilisés

# Supprimer les fichiers du dossier odoo-web-data s'il existe
ODOO_WEB_DATA_DIR="./odoo-web-data"
ODOO_WEB_DATA="$ODOO_WEB_DATA_DIR/*"
if [ -d "$ODOO_WEB_DATA_DIR" ]; then
    sudo rm -rf $ODOO_WEB_DATA
fi