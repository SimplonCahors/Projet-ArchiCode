### Comment installer le projet ?

Utilisation Composer + Drush pour ajouter des modules à drupal:

Dans le dossier de base de Drupal :
Composer est comme npm, permet de gérer les fichiers/dossiers
composer                    Donne toutes les commandes
composer require drupal/redirect        Installe le module “redirect”
composer install                Quand on reçoit un git, installe tous les composants

Dans le dossier /web :
Drush donne la possibilité d’utiliser une interface commande pour drupal
drush                        Donne toutes les commandes
drush status                    Statut du drupal
drush en redirect                Active les modules
drush cr                    vide le cache

### Pour installer composer et Drush : 

Composer : 

```  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer  ```


Drush : 

sur linux :

```  wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.5.1/drush.phar  ```


Puis : 

```  chmod +x drush.phar  ```

Et : 

```  sudo mv drush.phar /usr/local/bin/drush ```
