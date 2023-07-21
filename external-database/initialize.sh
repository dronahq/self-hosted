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

log_step "Downloading dump files"
echo ""

if [ -f "mysql-init.sql" ]; then
    log_step 'mysql-init.sql file already present, cleaning it up...'
    rm "mysql-init.sql"
fi
wget "${DHQ_SELF_HOSTED_LICENSE_URL}/self-hosted/master/init/mysql-init.sql"
echo ""

if [ -f "mongo-init.dump" ]; then
    log_step 'mongo-init.dump file already present, cleaning it up...'
    rm "mongo-init.dump"
fi
wget "${DHQ_SELF_HOSTED_LICENSE_URL}/self-hosted/master/init/mongo-init.dump"
echo ""

log_step "Enter credentials for databases"
echo ""

echo "Enter credentials of your MYSQL server"
echo ""

read -p "Enter database host : " rdshost
read -p "Enter port number": rdsport
read -p "Enter admin username : " rdsuser
read -p "Enter admin password : " rdspassword
echo ""

log_step "Restoring dump on MYSQL"

if ! command_present mysql; then
    log_step "mysql client not present. downloading it"
    $MAYBE_SUDO chmod 755 install-mysql.sh
    ./install-mysql.sh
fi

mysql --host=$rdshost --port=$rdsport --user=$rdsuser --password=$rdspassword < mysql-init.sql
sleep 300
rm mysql-init.sql

# mysql -h$rdshost --port=$rdsport -u$rdsuser -p$rdspassword -e "CREATE USER '$username'@'%' IDENTIFIED BY '$userpassword';"
# sleep 10
# mysql -h$rdshost --port=$rdsport -u$rdsuser -p$rdspassword -e "GRANT ALL PRIVILEGES ON *.* TO '$username'@'%';"
# sleep 10
# mysql -h$rdshost --port=$rdsport -u$rdsuser -p$rdspassword -e "FLUSH PRIVILEGES;"
# sleep 10

log_step "Restoring dump on MONGODB"
echo ""
echo "Enter credentials of your MONGODB server"
echo ""

read -p "Enter database host : " mongohost
read -p "Enter port number": mongoport
read -p "Enter admin username : " mongouser
read -p "Enter admin password : " mongopassword
echo ""

# read -p "Enter The documentdb tlskeyname : " tlskey
# mongosh --host $hostname:27017 --username $adminusername  --password $admincredential <<EOF
# use admin
# db.createUser({
#   user: '$username',
#   pwd: '$usercredential',
#   roles: [{
#     role: "userAdminAnyDatabase",
#     db: "admin"
#   }, {
#     role: 'readWrite',
#     db: 'db5x_studio'
#   }]
# })
# EOF
# sleep 5
# mongorestore \
#     --ssl \
#     --host=$hostname \
#     --port=$port \
#     --username=$adminusername \
#     --password=$admincredential \
#     --sslCAFile=$tlskey \
#     --archive=mongo-init.dump
# sleep 5

if ! command_present mongosh; then
    log_step "mongo client not present. downloading it"
    $MAYBE_SUDO chmod 755 install-mongo.sh
    ./install-mongo.sh
fi

mongorestore --host=$mongohost --port=$mongoport --username=$mongouser --password=$mongopassword --archive=mongo-init.dump
sleep 10

rm mongo-init.dump
log_step "Database restore process completed"
echo ""
