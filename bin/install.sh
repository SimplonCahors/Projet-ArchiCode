#!/bin/bash

SRC=$(cd $(dirname "$0"); pwd)
. "${SRC}/lib/include.sh"

ENV=$1

case $ENV in
        dev)
        ;;
        staging)
        ;;
        prod)
        ;;
        *)
        error "Unknown environment. Usage is 'install.sh (dev|preprod|prod)'."
        exit 1;
esac

# Run composer
cd $ROOT
$COMPOSER install

# Check settings
if [ ! -f "$WEBROOT/sites/default/settings.php" ]
then
  error "You need to copy and rename default.settings.php file to settings.php and set database creds"
  exit 1;
fi

# Install drupal
info 'Install Drupal'
$DRUSH si standard --account-name=incognito --account-pass=incognito --locale=fr --site-mail=$EMAIL --account-mail=$EMAIL --site-name="C+2B Architecture" -y

# Set a common site uuid
info 'Set common uuids'
$DRUSH config-set "system.site" uuid "23356c1b-17d2-4f05-91ca-e61da94d9137" -y
$DRUSH config-set language.entity.fr uuid "58f997ab-211d-4272-8d20-b33bbc0e88f7" -y

echo "${GREEN}Install is done!${NORMAL}"

info 'Run build'
${SRC}/build.sh $ENV
