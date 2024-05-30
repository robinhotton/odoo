## Architecture projet

---

```bash
|
|- addons/
|- config/
|   |- odoo.conf
|- odoo-web-data/
|- compose.yaml
```

- Le dossier **addons** créé précédemment permet de créer des extensions odoo
- Le dossier **odoo-web-data** possède toutes les informations sur le service web Odoo
- Le fichier **compose.yaml** permet de mettre en place l'environnement de manière automatisé
- Le dossier **config** permet de visualiser le fichier de configuration d'odoo comme _odoo.conf_ ou _requirements.txt_
- Le fichier **odoo.conf** permet de définir des paramètre complémentaire de l'environnement

<br>
<br>
<br>

## Architecture Docker

---

- Containers

  ```bash
  Odoo          # Container principal
  |- admirer-1  # Interface graphique pour visualiser la bdd
  |- db-1       # Service PostgreSQL
  |- web-1      # Service Odoo
  ```

- Volumes

  Volume 1 : odoo_odoo-db-data qui contient les données de la base de données  
  Volume 2 : volume anonyme. il sert a quoi ?

<br>
<br>
<br>

## Mettre en place le projet

---

1. Executer `sudo chmod +x ./up.sh ./down.sh`
2. Executer `sudo ./up.sh`
3. Se connecter à [Odoo](http://localhost:8069/) :

- Master Password: 0123-4567-8910
- Database Name: odoo
- Email: votre mail diginamic-formation
- Password: Diginamic34\_

4. Télécharger le module project
5. Se connecter sur [PostgreSQL](http://localhost:8070/) :

- System: PostgreSQL
- Server: db
- USername: herve
- Password: herve
- Database: odoo

<br>
<br>
<br>

## Désinstaller l'environnement

---

Executer `sudo ./down.sh`

Il va supprimer :

- 3 containers
- les 2 volumes
- le _.local_ du dossier odoo-web-data

<br>
<br>
<br>

## Créer son module personnalisé

---

1. Exécuter `docker ps` pour voir les nom et id des dockers
2. Exécuter `docker exec -it <odoo-docker> bash`, avec l'id ou le nomdu docker odoo
3. Exécuter `odoo scaffold <new_module_name> /mnt/extra-addons` pour créer la structure de votre module

<br>
<br>
<br>

## Installer son module personnalisé sur odoo

---

1. Activer le **developer Tools** de odoo : _carre en haut à gauche > Settings > Developer Tools > Activate_
2. Actualiser la page odoo _Carre en haut à gauche > Apps > Update Apps List > Update_
3. Rechercher son module : _searchbar > Filters > supprime Apps > Taper le nom de votre module_
4. Cliquer sur _Activate_

<br>
<br>
<br>

## Ressources complémentaire

---

Contrairement à la doc de mise en place du docker Odoo, la documentation du développement de module personnalisé me semble plus complète et plus fournis avec des élements préfait et des outils sur lesquels ont peut se reposer afin d'avoir du code plus maintenable et être plus productif.

Odoo :

- [Documentation officiel Odoo 17](https://www.odoo.com/documentation/17.0/)
- [IDE odoo.sh](https://youtu.be/QuNsa9n9PMg)
- [Exemple de module personnalisés](https://github.com/er-harsh-dhaduk/odoo-training/tree/16.0/custom_addons)
- [Playlist developpement Odoo 17](https://www.youtube.com/playlist?list=PLAR8TpPnVeTTt2EpERduzawPjD4ToMtvc)
- [Confort de developpement](https://apps.odoo.com/apps/modules/17.0/odoo_python_pip_install_library/)
- [odoo.conf, Dockerfile](https://github.com/odoo/docker/tree/master/17.0)
- [odoo module code](https://github.com/odoo/odoo/tree/17.0/addons)

Docker docs :

- [watch](https://docs.docker.com/language/python/develop/)
- [dockerfile](https://docs.docker.com/reference/dockerfile/)
- [networking](https://docs.docker.com/compose/networking/)

<br>
<br>
<br>

## notes

---

### actualiser

Pour actualiser les dépendances des modules, il faut `sudo docker compose restart`
S'il n'y a que des vues modifier, celan'est pas la peine.

### auto install

Dans le `__manifest__.py`, il y a 2 mot clé pour faire des installation automatique

1. `'depends': ['student'],` permet d'installer le module student si se module est installé.
2. `'auto_install': True,` si toutes les dépendances sont installé mais pas ce module, permet de l'installer automatiquement.
