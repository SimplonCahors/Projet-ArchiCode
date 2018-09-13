#!/bin/bash

### Directory webroot & Prodile name
DIRECTORY="web"

ROOT=$(dirname "${SRC}")

### Working directory.
REPOSITORY="${ROOT}"
WEBROOT="${ROOT}/${DIRECTORY}"

### Get composer
COMPOSER=`which composer`

### Fix composer not found (staging)
if ! type "$COMPOSER" &> /dev/null; then
  COMPOSER="/usr/local/sbin/composer"
fi

### Get NPM
NPM=`which npm`

### Make drush a variable to use the one shipped with the repository.
DRUSH="${ROOT}/vendor/drush/drush/drush --root=$WEBROOT"

### Current user mail
EMAIL=$(git config user.email)
if [ -z "${EMAIL}" ]; then EMAIL="admin@local.host"; fi

# Colors
RED=$'\e[31;01m'
BLUE=$'\e[36;01m'
YELLOW=$'\e[33;01m'
NORMAL=$'\e[0m'
GREEN=$'\e[32;01m'
