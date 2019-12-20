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
        error "Unknown environment. Usage is 'build.sh (dev|staging|prod)'."
        exit 1;
esac

# Put the site offline for visitors.
cd $ROOT
info 'Enable maintenance mode'
$DRUSH sset system.maintenance_mode 1;

notice 'Run composer install'
$COMPOSER install

# Rebuild the registry in case some modules have been moved.
notice 'Rebuild caches'
$DRUSH cr

# Run the database updates.
notice 'Run updb'
$DRUSH updb -y

# Run the entities updates
# notice 'Run entities updates'
# $DRUSH updb --entity-updates -y

# Import config
notice 'Import configuration'
$DRUSH config-import -y

# Run the potential actions to do post deployment.
notice 'Run post deploy actions'
case $ENV in
    dev)
        # Enable devtools
        $DRUSH en -y devel kint;
    ;;
    staging)
        # Disable devtools
        $DRUSH pm-uninstall -y devel devel_generate kint;

        # Enable dblog.
        $DRUSH en -y dblog;
        $DRUSH pm-uninstall -y syslog;
    ;;
    prod)
        # Disable devtools
        $DRUSH pm-uninstall -y devel devel_generate kint;

        # Enable syslog.
        $DRUSH pm-uninstall -y dblog;
        $DRUSH en -y syslog;

    ;;
  esac

# Refresh translations
notice 'Refresh translations'
#$DRUSH locale:check
$DRUSH locale:update

# Rebuild permission
notice 'Rebuild drupal permission'
$DRUSH php-eval 'node_access_rebuild();'

# Put the site back online.
info 'Disable maintenance mode'
$DRUSH sset system.maintenance_mode 0;

# Clear the caches.
notice 'Rebuild caches'
$DRUSH cr

# Run build
# notice 'Run build'
# $NPM run build

# End
echo "${GREEN}Build is done!${NORMAL}"
