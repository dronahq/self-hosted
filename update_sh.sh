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
  echo ''
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
  echo "${GREEN}${BOLD}WARNING${NORMAL}${BOLD}: $1${NORMAL}"
  shift
  while [ "$#" -gt "0" ]; do
    echo " - $1"
    shift
  done
}

log_step "Checking for updates..."

current_version=$(head -n 1 version)

echo "Current version is ${current_version}"

license_url="https://license.dronahq.com"

updates=$(curl -s --insecure "${license_url}/api/checkforupdates?empty=false&version=${current_version}" --header 'Authorization: S9wbseRCkzE23fRK5soIkuUBpGW4sLUG')

if [ -z "$updates" ]; then
  log_step "No new updates are available for you."
  exit 1
fi

IFS=',' read -r -a update_list <<< "$updates"

echo "Select any version from below list to update to"
for i in "${update_list[@]}"; do
  echo "$i"
done
read -p "Enter target version here: " target_version

if [[ ! " ${update_list[*]} " =~ " ${target_version} " ]]; then
    error_exit "Invalid target version selected. Please try again."
fi

if [ "$current_version" = "$target_version" ]; then
    error_exit "You are already in target version. aborting the process".
fi

log_step "pulling image from docker."

if [[ "$($MAYBE_SUDO docker images -q dronahq/self-hosted:$target_version 2> /dev/null)" == "" ]]; then
  log_step "Target docker image not present locally."
  $MAYBE_SUDO docker pull dronahq/self-hosted:$target_version
else
  log_step "Target docker image present locally."
  log_step "Create dump from previous DB "
  $MAYBE_SUDO chmod 755 ./backup_sh.sh
  ./backup_sh.sh
fi

if [ $( $MAYBE_SUDO docker ps -a | grep dronahq-self-hosted-webapp | wc -l ) -gt 0 ]; then
  log_step "Webapp Container running. Removing old container"
  $MAYBE_SUDO docker stop dronahq-self-hosted-webapp
  $MAYBE_SUDO docker rm dronahq-self-hosted-webapp
fi

echo ""

if [[ "$($MAYBE_SUDO docker images -q dronahq/self-hosted:$current_version 2> /dev/null)" != "" ]]; then
  read -p "Do you want to remove old docker image? (type 'y' for yes): " remove_consent
  if [ "$remove_consent" == "y" ]; then
    log_step "Cleaning old image."
    $MAYBE_SUDO docker rmi dronahq/self-hosted:$current_version
  fi
fi

log_step "Fetching docker-compose file for target version"
curl --insecure $license_url/repository/docker-compose/$target_version --header 'Authorization: S9wbseRCkzE23fRK5soIkuUBpGW4sLUG' -o docker-compose.yml

log_step "Creating new container"
$MAYBE_SUDO docker-compose up -d webapp

log_step "Updating version file"
echo "$target_version" > version

log_step "Begining with database updates..."

log_step "Clearing old files..."
if [ -f "update.sql" ]; then
  $MAYBE_SUDO rm update.sql
fi

rootpassword=$(grep MYSQL_ROOT_PASSWORD ./dronahq.env | cut -d "=" -f2 | cut -d "'" -f2 | cut -d '"' -f2)

log_step "Fetching updates..."

curl --insecure "${license_url}/api/getdbupdates?empty=false&current_version=${current_version}&target_version=${target_version}" --header 'Authorization: S9wbseRCkzE23fRK5soIkuUBpGW4sLUG' -o update.sql

log_step "Copying updates to container..."

$MAYBE_SUDO docker cp ./update.sql dronahq-self-hosted-mysqldb:/

log_step "Applying updates..."
$MAYBE_SUDO docker exec dronahq-self-hosted-mysqldb /bin/sh -c "mysql -u root -p$rootpassword </update.sql"

log_step "Database Update completed."

# log_step "Removing temporary files..."
# if [ -f "update.sql" ]; then
#   $MAYBE_SUDO rm update.sql
# fi

log_step "Update successful, Please refresh your browser window to reflect the changes"
