#!/usr/bin/env bash

# NB: local trial script has to be self-contained
# See https://sipb.mit.edu/doc/safe-shell/

set -euf -o pipefail

# Detect the operating system
case "$OSTYPE" in
  linux-gnu*)
    export MAYBE_SUDO="sudo"
    PLATFORM="linux"
    ;;
  darwin*)
    export MAYBE_SUDO="sudo"
    PLATFORM="macos"
    ;;
  cygwin* | msys* | mingw*)
    export MAYBE_SUDO=""
    PLATFORM="windows"
    ;;
  *)
    error_exit "Unsupported platform: $OSTYPE"
    ;;
esac

# Handle colored output if the terminal supports it
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

# Error handling function
error_exit() {
  echo ''
  echo "${RED}${BOLD}ERROR${NORMAL}${BOLD}: $1${NORMAL}"
  shift
  while [ "$#" -gt 0 ]; do
    echo " - $1"
    shift
  done
  exit 1
}

# Logging function for steps
log_step() {
  echo ''
  echo "${GREEN}${BOLD}INFO${NORMAL}${BOLD}: $1${NORMAL}"
  shift
  while [ "$#" -gt 0 ]; do
    echo " - $1"
    shift
  done
}

# Logging function for warnings
log_warn() {
  echo ''
  echo "${CYAN}${BOLD}WARNING${NORMAL}${BOLD}: $1${NORMAL}"
  shift
  while [ "$#" -gt 0 ]; do
    echo " - $1"
    shift
  done
}

# Main script starts here
log_step 'Downloading resources...'

LICENSE_URL_PATH='https://license.dronahq.com/self-hosted'

# Use platform-specific tools if needed
case "$PLATFORM" in
  linux | macos)
    curl_cmd="curl -L -fsSL"
    ;;
  windows)
    curl_cmd="curl.exe -L -fsSL"
    ;;
esac

# Download scripts
$curl_cmd -o get-docker.sh "$LICENSE_URL_PATH/master/get-docker.sh"
$curl_cmd -o get-docker-compose.sh "$LICENSE_URL_PATH/master/get-docker-compose.sh"
log_step 'Docker scripts downloaded'

# Download init scripts
$curl_cmd -o ./init/containerd.service "$LICENSE_URL_PATH/master/init/containerd.service"
$curl_cmd -o ./init/mongo-init.dump "$LICENSE_URL_PATH/master/init/mongo-init.dump"
$curl_cmd -o ./init/mongo-init.sh "$LICENSE_URL_PATH/master/init/mongo-init.sh"
$curl_cmd -o ./init/my.cnf "$LICENSE_URL_PATH/master/init/my.cnf"
$curl_cmd -o ./init/mysql-init.sql "$LICENSE_URL_PATH/master/init/mysql-init.sql"
$curl_cmd -o ./init/nginx-ssl-default.conf "$LICENSE_URL_PATH/master/init/nginx-ssl-default.conf"
$curl_cmd -o ./init/nginx.conf "$LICENSE_URL_PATH/master/init/nginx.conf"
log_step 'init scripts downloaded.'

# Download install and update scripts
$curl_cmd -o install_sh.sh "$LICENSE_URL_PATH/master/install_sh.sh"
$curl_cmd -o backup_sh.sh "$LICENSE_URL_PATH/master/backup_sh.sh"
$curl_cmd -o update_sh.sh "$LICENSE_URL_PATH/master/update_sh.sh"
log_step 'install/update scripts downloaded'

# Download additional resources
$curl_cmd -o update_resources.sh "$LICENSE_URL_PATH/master/update_resources.sh"
$curl_cmd -o container-reset.sh "$LICENSE_URL_PATH/master/container-reset.sh"
log_step "container reset scripts downloaded."

# Download setup scripts
$curl_cmd -o dronahq_setup "$LICENSE_URL_PATH/master/dronahq_setup"
$curl_cmd -o setup.sh "$LICENSE_URL_PATH/master/setup.sh"
log_step 'setup scripts downloaded'

# Download certbot docker-compose file
$curl_cmd -o certbot-docker-compose.yml "$LICENSE_URL_PATH/master/certbot-docker-compose.yml"

# Download docker-compose.yml if not present
if [ ! -f ./docker-compose.yml ]; then
  $curl_cmd -o docker-compose.yml "$LICENSE_URL_PATH/master/docker-compose.yml"
  $curl_cmd -o version "$LICENSE_URL_PATH/master/version"
fi

# Copy nginx.conf if not present
if [ ! -f ./nginx.conf ]; then
  cp init/nginx.conf nginx.conf
fi

log_step 'All resources updated!'
