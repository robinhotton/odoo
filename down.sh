#!/bin/bash

# Arrêter et supprimer les conteneurs Docker
sudo docker compose down
sudo docker volume rm -f odoo_odoo-db-data # supprimer le volume de la bdd postgres
sudo docker volume prune -f # supprimer les volumes anonyme inutilisés

# Supprimer le dossier .local du dossier odoo-web-data s'il existe
ODOO_DATA_DIR="odoo-web-data"
LOCAL_DIR="$ODOO_DATA_DIR/*"
if [ -d "$LOCAL_DIR" ]; then
    sudo rm -rf "$LOCAL_DIR"
    echo "Le dossier $LOCAL_DIR a été supprimé."
fi