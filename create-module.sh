#!/bin/bash

# Vérifier si un argument a été fourni
if [ -z "$1" ]; then
    echo "Erreur : aucun nom de module fourni."
    exit 1
fi

# Exécuter la commande 'odoo scaffold' dans le conteneur Docker
docker exec -it odoo-web-1 odoo scaffold $1 /mnt/extra-addons

# Changer le propriétaire du répertoire du module
sudo chown -R robin:robin ./addons-tecken/$1

# Changer les permissions du répertoire du module
sudo chmod -R 777 ./addons-tecken/$1

echo "Le module $1 a été créé et les permissions ont été mises à jour."