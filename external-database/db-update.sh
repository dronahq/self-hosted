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

echo ""
read -p "Enter DronaHQ License Proxy url. If you dont need to setup proxy, press Enter: " DHQ_SELF_HOSTED_LICENSE_URL
# DHQ_SELF_HOSTED_LICENSE_URL=''

if [ -z "$DHQ_SELF_HOSTED_LICENSE_URL" ]; then
  DHQ_SELF_HOSTED_LICENSE_URL="https://license.dronahq.com"
fi

log_step "DronaHQ License Proxy set as $DHQ_SELF_HOSTED_LICENSE_URL"

echo ''

export DISTRO=$( (lsb_release -ds || cat /etc/*release || uname -om) 2>/dev/null | head -n1)

command_present() {
  type "$1" >/dev/null 2>&1
}

# ------------------------------------------------------------------------------------------------

log_step "Checking for updates..."

current_version=$(head -n 1 version)

echo "Current version is ${current_version}"

updates=$(curl -s --insecure "${DHQ_SELF_HOSTED_LICENSE_URL}/api/checkforupdates?empty=false&version=${current_version}" --header 'Authorization: S9wbseRCkzE23fRK5soIkuUBpGW4sLUG')

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

# ------------------------------------------------------------------------------------------------

log_step "Begining with database updates..."

log_step "Clearing old files..."
if [ -f "update.sql" ]; then
  $MAYBE_SUDO rm update.sql
fi

rdshost=$(grep DHQ_MYSQL_HOST ./../dronahq.env | cut -d "=" -f2 | cut -d "'" -f2 | cut -d '"' -f2)
rdsport=$(grep DHQ_MYSQL_PORT ./../dronahq.env | cut -d "=" -f2 | cut -d "'" -f2 | cut -d '"' -f2)
rdsuser=$(grep DHQ_MYSQL_USER ./../dronahq.env | cut -d "=" -f2 | cut -d "'" -f2 | cut -d '"' -f2)
rdspassword=$(grep DHQ_MYSQL_PASSWORD ./../dronahq.env | cut -d "=" -f2 | cut -d "'" -f2 | cut -d '"' -f2)

log_step "Fetching updates..."
curl --insecure "${license_url}/api/getdbupdates?empty=false&current_version=${current_version}&target_version=${target_version}" --header 'Authorization: S9wbseRCkzE23fRK5soIkuUBpGW4sLUG' -o update.sql

log_step "Applying updates..."
$MAYBE_SUDO docker exec dronahq-self-hosted-mysqldb /bin/sh -c "mysql -u root -p$rootpassword </update.sql"

if ! command_present mysql; then
    log_step "mysql client not present. downloading it"
    $MAYBE_SUDO chmod 755 install-mysql.sh
    ./install-mysql.sh
fi

mysql --host=$rdshost --port=$rdsport --user=$rdsuser --password=$rdspassword < update.sql

log_step "Database Update completed."

log_step "Removing temporary files..."
if [ -f "update.sql" ]; then
  $MAYBE_SUDO rm update.sql
fi
echo ""