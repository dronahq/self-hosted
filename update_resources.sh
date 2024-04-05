#!/usr/bin/env bash

# NB: local trial script has to be self-contained
# See https://sipb.mit.edu/doc/safe-shell/

# /bin/bash -c "$(curl -fsSL https://license.dronahq.com/self-hosted/update_resources.sh)"

set -euf -o pipefail

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export MAYBE_SUDO="sudo"
else
  export MAYBE_SUDO=""
fi

if [ -t 1 ]; then
  export NORMAL="$(tput sgr0)"
  export RED="$(tput setaf 1)"
  export GREEN="$(tput setaf 2)"
  export MAGENTA="$(tput setaf 5)"
  export CYAN="$(tput setaf 6)"
  export WHITE="$(tput setaf 7)"
  export BOLD="$(tput bold)"
else
  export NORMAL=""
  export RED=""
  export GREEN=""
  export MAGENTA=""
  export CYAN=""
  export WHITE=""
  export BOLD=""
fi

error_exit() {
  echo ''
  echo "${RED}${BOLD}ERROR${NORMAL}${BOLD}: $1${NORMAL}"
  shift
  while [ "$#" -gt "0" ]; do
    echo " - $1"
    shift
  done
  exit 1
}

log_step() {
  echo ''
  echo "${GREEN}${BOLD}INFO${NORMAL}${BOLD}: $1${NORMAL}"
  shift
  while [ "$#" -gt "0" ]; do
    echo " - $1"
    shift
  done
}

log_warn() {
  echo ''
  echo "${CYAN}${BOLD}WARNING${NORMAL}${BOLD}: $1${NORMAL}"
  shift
  while [ "$#" -gt "0" ]; do
    echo " - $1"
    shift
  done
}

# NB: trim trailing slash on $TMPDIR as different OS's do it differently
# INSTALL_DIRECTORY="$HOME/dronahq"
# DOCKER_CONTEXT="$INSTALL_DIRECTORY/self-hosted"
# log_step "Changing working directory to $DOCKER_CONTEXT"
# cd "$DOCKER_CONTEXT"

log_step 'Downloading resources...'

LICENSE_URL_PATH='https://license.dronahq.com/self-hosted'

curl -L -fsSL -o ./init/mongo-init.dump "$LICENSE_URL_PATH/master/init/mongo-init.dump"
curl -L -fsSL -o ./init/mongo-init.sh "$LICENSE_URL_PATH/master/init/mongo-init.sh"
curl -L -fsSL -o ./init/my.cnf "$LICENSE_URL_PATH/master/init/my.cnf"
curl -L -fsSL -o ./init/mysql-init.sql "$LICENSE_URL_PATH/master/init/mysql-init.sql"
curl -L -fsSL -o ./init/nginx-ssl-default.conf "$LICENSE_URL_PATH/master/init/nginx-ssl-default.conf"
curl -L -fsSL -o ./init/nginx.conf "$LICENSE_URL_PATH/master/init/nginx.conf"

curl -L -fsSL -o get-docker.sh "$LICENSE_URL_PATH/master/get-docker.sh"
curl -L -fsSL -o get-docker-compose.sh "$LICENSE_URL_PATH/master/get-docker-compose.sh"
curl -L -fsSL -o install_sh.sh "$LICENSE_URL_PATH/master/install_sh.sh"
curl -L -fsSL -o backup_sh.sh "$LICENSE_URL_PATH/master/backup_sh.sh"
curl -L -fsSL -o update_sh.sh "$LICENSE_URL_PATH/master/update_sh.sh"
curl -L -fsSL -o update_resources.sh "$LICENSE_URL_PATH/master/update_resources.sh"

curl -L -fsSL -o container_reset.sh "$LICENSE_URL_PATH/master/container_reset.sh"
curl -L -fsSL -o dronahq_setup "$LICENSE_URL_PATH/master/dronahq_setup"
curl -L -fsSL -o setup.sh "$LICENSE_URL_PATH/master/setup.sh"

curl -L -fsSL -o certbot-docker-compose.yml "$LICENSE_URL_PATH/master/certbot-docker-compose.yml"

if [ ! -f ./docker-compose.yml ]; then
  curl -L -fsSL -o docker-compose.yml "$LICENSE_URL_PATH/master/docker-compose.yml"
  curl -L -fsSL -o version "$LICENSE_URL_PATH/master/version"
fi

if [ ! -f ./nginx.conf ]; then
  cp init/nginx.conf nginx.conf
fi

log_step 'All resources updated !'
