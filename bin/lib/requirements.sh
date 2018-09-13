#!/bin/bash

# Check composer install
if ! type "$COMPOSER" &> /dev/null; then
  error "You need to install composer first! @see https://getcomposer.org/doc/00-intro.md"
  exit 1;
fi

# Check NPM install
if ! type "$NPM" &> /dev/null; then
  error "You need to install NPM first! @see https://www.npmjs.com/get-npm"
  exit 1;
fi
