#!/bin/bash


# /!\ This script needs the bc package installed on the server.
# Helper to let you run the install script from anywhere.
currentscriptpath () {
  SOURCE="${BASH_SOURCE[0]}"
  # resolve $SOURCE until the file is no longer a symlink
  while [ -h "$SOURCE" ]; do

    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  echo $DIR
}


#
# Loging functions
#

info(){
    echo "${YELLOW} ${1} ${NORMAL}" >&2;
}

notice(){
    echo "${BLUE} ${1} ${NORMAL}" >&2;
}

error(){
    echo "${RED} ${1} ${NORMAL}" >&2;
}


# exit functions
bad_exit() {
    echo ;
    echo "${RED} ERROR: ${1}" >&2;
    echo "${NORMAL}" >&2;
    exit 1;
}

