#!/usr/bin/env bash

# NB: local trial script has to be self-contained
# See https://sipb.mit.edu/doc/safe-shell/
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

# read -p "Enter DronaHQ License Proxy url. If you dont need to setup proxy, press Enter: " DHQ_SELF_HOSTED_LICENSE_URL
DHQ_SELF_HOSTED_LICENSE_URL=''

if [ -z "$DHQ_SELF_HOSTED_LICENSE_URL" ]; then
  DHQ_SELF_HOSTED_LICENSE_URL="https://license.dronahq.com"
fi

log_step "DronaHQ License Proxy set as $DHQ_SELF_HOSTED_LICENSE_URL"

echo ''

export DISTRO=$( (lsb_release -ds || cat /etc/*release || uname -om) 2>/dev/null | head -n1)

command_present() {
  type "$1" >/dev/null 2>&1
}

dronahq_containers_present() {
  # NB: awk is to remove whitespace from `wc`
  DRONAHQ_IMAGES="$($MAYBE_SUDO docker image ls | grep 'dronahq/self-hosted' | wc -l | awk '{print $1}')"
  test "$DRONAHQ_IMAGES" -gt '0'
}

dronahq_trial_running() {
  # NB: awk is to remove whitespace from `wc`
  CONTAINERS="$($MAYBE_SUDO docker-compose ps -q | wc -l | awk '{print $1}')"
  test "$CONTAINERS" -gt '0'
}

# NB: trim trailing slash on $TMPDIR as different OS's do it differently
INSTALL_DIRECTORY="$HOME/dronahq"
DOCKER_CONTEXT="$INSTALL_DIRECTORY/self-hosted"

cd "$HOME"

if [ ! -d "$DOCKER_CONTEXT" ]; then
  if [ -d "$INSTALL_DIRECTORY" ]; then
    log_step 'found a partial install, cleaning it up...'
    rm -rf "$INSTALL_DIRECTORY"
  fi

  log_step 'setting up install location...' "$INSTALL_DIRECTORY"
  mkdir dronahq && cd dronahq

  if ! command_present unzip; then
    log_warn '`unzip` not found!'
    log_warn 'Attempting to git clone instead'
    if command_present git; then
      log_step 'cloning...'
      git clone https://github.com/dronahq/self-hosted.git
    elif command_present yum; then
      log_warn 'You did not have git so installing'
      sudo yum install git
      git clone https://github.com/dronahq/self-hosted.git
    else
      error_exit "Please install git or unzip before continuing"
    fi
  else
    log_step 'downloading...'
    curl -L -XGET -o master.zip $DHQ_SELF_HOSTED_LICENSE_URL/self-hosted/master.zip # TODO(hirday): change back to master
    log_step 'unpacking...'
    unzip -q master.zip
    mv master self-hosted # TODO(hirday): change back to master
  fi

  chmod 755 ./self-hosted/get-docker.sh
  chmod 755 ./self-hosted/get-docker-compose.sh
  chmod 755 ./self-hosted/backup_sh.sh

  # NB: this is to make onprem containers to all get named the same.
  cd self-hosted
  if ! command_present unzip; then
    git checkout main
  fi
  DOCKER_CONTEXT="$(pwd)"

  cp ./init/nginx.conf nginx.conf

  # rootpassword=$(cat /dev/urandom | base64 | head -c 64)
  # dbpassword=$(cat /dev/urandom | base64 | head -c 64)

  rootpassword='idQnkrCOLNx5V05k8uPFZjpluOWF6PCO'
  dbpassword='idQnkrCOLNx5V05k8uPFZjpluOWF6PCO'
  
  echo "# DronaHQ Environment File" > dronahq.env

  echo "BUILDER_URL='http://localhost'" >> dronahq.env

  echo "DHQ_MYSQL_HOST='dronahq-self-hosted-mysqldb'" >> dronahq.env
  echo "DHQ_MYSQL_USER='dronahq'" >> dronahq.env
  echo "DHQ_MYSQL_PASSWORD='$dbpassword'" >> dronahq.env
  echo "DHQ_MYSQL_DATABASE='db5x'" >> dronahq.env
  echo "DHQ_MYSQL_PORT='3306'" >> dronahq.env
  
  echo "DHQ_MONGODB_HOST='dronahq-self-hosted-mongodb'" >> dronahq.env
  echo "DHQ_MONGODB_USER='dronahq'" >> dronahq.env
  echo "DHQ_MONGODB_PASSWORD='$dbpassword'" >> dronahq.env
  echo "DHQ_MONGODB_DATABASE='db5x_studio'" >> dronahq.env
  echo "DHQ_MONGODB_PORT='27017'" >> dronahq.env
  
  echo "DHQ_AUDIT_LOG_MYSQL_HOST='dronahq-self-hosted-mysqldb'" >> dronahq.env
  echo "DHQ_AUDIT_LOG_MYSQL_USER='dronahq'" >> dronahq.env
  echo "DHQ_AUDIT_LOG_MYSQL_PASSWORD='$dbpassword'" >> dronahq.env
  echo "DHQ_AUDIT_LOG_MYSQL_DATABASE='dhq_audit_log'" >> dronahq.env
  echo "DHQ_AUDIT_LOG_MYSQL_PORT='3306'" >> dronahq.env
  
  echo "MYSQL_ROOT_PASSWORD='$rootpassword'" >> dronahq.env
  echo "MYSQL_DATABASE='db5x'" >> dronahq.env
  echo "MYSQL_USER='dronahq'" >> dronahq.env
  echo "MYSQL_PASSWORD='$dbpassword'" >> dronahq.env
  
  echo "MONGO_INITDB_ROOT_USERNAME='root'" >> dronahq.env
  echo "MONGO_INITDB_ROOT_PASSWORD='$rootpassword'" >> dronahq.env
  echo "MONGO_INITDB_USER='dronahq'" >> dronahq.env
  echo "MONGO_INITDB_PWD='$dbpassword'" >> dronahq.env

  echo "DHQ_SELF_HOSTED_LICENSE_URL='$DHQ_SELF_HOSTED_LICENSE_URL'" >> dronahq.env

  log_step 'setting environment variables'
  read -p "Enter your license key: " licenseKey

  echo "LICENSE_KEY=$licenseKey" >> dronahq.env

  status=`curl --insecure --silent --connect-timeout 8 --output /dev/null $DHQ_SELF_HOSTED_LICENSE_URL/validate?key=$licenseKey -I -w "%{http_code}\n"`

  # echo "$status"

  if [[ "$status" != "202" ]]; then
    error_exit "License Key you entered is Invalid. Please try again with valid key".
  fi

  if ! command_present docker; then
    # shellcheck disable=2016
    log_warn '`docker` not found! Attempting to install. This may take a few minutes.'
    ./get-docker.sh

    if ! command_present docker; then
      if [[ "$OSTYPE" == "darwin"* ]]; then
        error_exit "please install \`docker\` manually" \
          "Instructions can be found at ${WHITE}${BOLD}https://docs.docker.com/${NORMAL}" \
          "${BOLD}Remember${NORMAL} to start the \`Docker\` app from the UI."
      else
        error_exit "please install \`docker\` manually" \
          "Instructions can be found at ${WHITE}${BOLD}https://docs.docker.com/${NORMAL}" \
          "${BOLD}Remember${NORMAL} to start the \`docker\` daemon/service."
      fi
    fi
  else
    # shellcheck disable=2016
    log_step '`docker` found!'
  fi

  if ! command_present docker-compose; then
    # shellcheck disable=2016
    log_warn '`docker-compose` not found! Attempting to install'
    ./get-docker-compose.sh

    if ! command_present docker-compose; then
      if [[ "$OSTYPE" == "darwin"* ]]; then
        error_exit "please install \`docker-compose\` manually" \
          "Usually, \`docker\` and \`docker-compose\` are bundled together, consider uninstalling your existing docker implementation" \
          "Instructions can be found at ${WHITE}${BOLD}https://docs.docker.com/${NORMAL}" \
          "${BOLD}Remember${NORMAL} to start the \`Docker\` app and wait for it to be ${GREEN}${BOLD}READY${NORMAL}."
      else
        error_exit "please install \`docker-compose\` manually" \
          "Usually, \`docker\` and \`docker-compose\` are bundled together, consider uninstalling your existing docker implementation" \
          "Instructions can be found at ${WHITE}${BOLD}https://docs.docker.com/${NORMAL}" \
          "${BOLD}Remember${NORMAL} to start the \`docker\` daemon/service and wait for it to be ${GREEN}${BOLD}READY${NORMAL}."
      fi
    fi
  else
    # shellcheck disable=2016
    log_step '`docker-compose` found!'
  fi

  if [[ $DISTRO == *"CentOS"* ]]; then
    echo 'Starting docker service and making compose accessible by root user'
    if [ ! -f /usr/bin/docker-compose ]; then
      sudo ln -s /usr/local/bin/docker-compose  /usr/bin/docker-compose
    fi
    sudo systemctl enable docker.service
    sudo systemctl start docker.service
  fi

  if dronahq_containers_present; then
    log_step 'noticed you have tried DronaHQ before, cleaning up...'
    $MAYBE_SUDO docker-compose rm -fsv
  fi
else
  cd "$DOCKER_CONTEXT" || error_exit "Couldn't \`cd\` into '$DOCKER_CONTEXT'" \
    "if you are having repeat issues, you can \`rm -rf $INSTALL_DIRECTORY\`" \
    "if you're still having issues, you can stop all docker containers using the \`docker\` command"
fi

if (! $MAYBE_SUDO docker stats --no-stream) && [ "$OSTYPE" == "linux-gnu" ] && [ "$DISTRO" != "*centos*" ]; then
   sudo docker service start
fi

if dronahq_trial_running; then
  log_step 'stopping DronaHQ for update...'
  $MAYBE_SUDO docker-compose down
fi

log_step 'updating DronaHQ!'
$MAYBE_SUDO docker-compose pull

log_step "running DonaHQ! ${WHITE}${BOLD}This can take up to 5 minutes${NORMAL}"

$MAYBE_SUDO docker-compose up -d

echo ""
echo " -- ${GREEN}${BOLD}!! DRONAHQ IS BOOTING !!${NORMAL} --"

printf "%s%s%s%s" "Waiting for DronaHQ to start up... " "${RED}${BOLD}" "<Pressing Ctrl-C may prevent proper start-up>" "$NORMAL"

sleep 180

# NB: empty stuff to fully wipe out previous line completely
printf "\r%s%s%s%s%s%s%s%s" "$MAGENTA" 'Check out your ' "$BOLD" 'BROWSER' "${NORMAL}${MAGENTA}" ' for some awesomeness!!!' "$NORMAL" '                              '
echo

# echo ""
# echo "  ${CYAN}Navigate to${NORMAL}:          ${WHITE}${BOLD}http://localhost:3000/auth/signup${NORMAL}    or    ${WHITE}${BOLD}[publically_accessible_ip]:3000/auth/signup${NORMAL}"
# echo "  ${CYAN}To STOP DronaHQ, run${NORMAL}:  ${WHITE}${BOLD}${DOCKER_CONTEXT}/stop-local-trial${NORMAL}"
# echo "  ${CYAN}To RESTART DronaHQ, run${NORMAL}:  ${WHITE}${BOLD}${DOCKER_CONTEXT}/local-trial${NORMAL}"
# echo ""

echo "DronaHQ was installed in ~/dronahq. It will run in the background until you manually stop it. If DronaHQ stops you can restart it without losing your data. "

if command_present open; then
  open 'http://localhost'
fi
