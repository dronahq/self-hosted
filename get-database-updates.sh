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

export DISTRO=$( (lsb_release -ds || cat /etc/*release || uname -om) 2>/dev/null | head -n1)

command_present() {
  type "$1" >/dev/null 2>&1
}

# ------------------------------------------------------------------------------------------------

export DRONAHQ_LICENSE_URL="https://license.dronahq.com"

log_step "Checking for updates..."

current_version=$(head -n 1 version)

echo "Current version is ${current_version}"

updates=$(curl -s --insecure "${DRONAHQ_LICENSE_URL}/api/checkforupdates?empty=false&version=${current_version}" --header 'Authorization: S9wbseRCkzE23fRK5soIkuUBpGW4sLUG')

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
  # $MAYBE_SUDO rm update.sql
  mv update.sql update-$(date +"%Y-%m-%d_%H-%M-%S").sql
fi

log_step "Fetching updates..."
curl --insecure "${DRONAHQ_LICENSE_URL}/api/getdbupdates?empty=false&current_version=${current_version}&target_version=${target_version}" --header 'Authorization: S9wbseRCkzE23fRK5soIkuUBpGW4sLUG' -o update.sql

log_step "Updates downloaded in file 'update.sql'"

# ------------------------------------------------------------------------------------------------

