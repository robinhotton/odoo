#!/bin/bash

# Définir les variables
CONFIG_DIR="config"
ADDONS_TECKEN_DIR="addons-tecken"
ADDONS_ODOO_DIR="addons-odoo"
ODOO_DATA_DIR="odoo-web-data"
ODOO_CONF=""

# Créer les répertoires nécessaires s'ils n'existent pas
mkdir -p $CONFIG_DIR $ADDONS_TECKEN_DIR $ADDONS_ODOO_DIR $ODOO_DATA_DIR # -p permet de ne pas avoir d'erreur si le dossier existe déjà

# Déplacer le fichier de configuration dans le répertoire de configuration s'il existe
if [ -f "odoo.conf" ]; then
    ODOO_CONF="$CONFIG_DIR/odoo.conf"
    mv -f odoo.conf $CONFIG_DIR/ # -f force l'écrasement
fi

# Donner les permissions nécessaires à tous les fichiers et dossiers dans le répertoire courant
chmod -R 777 .

# Lancer les conteneurs Docker
sudo docker compose watch

# Afficher un message de fin
echo 'Environnement setup !'
