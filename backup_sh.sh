if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export MAYBE_SUDO="sudo"
else
  export MAYBE_SUDO=""
fi

if [ ! -d "backups" ]; then
  mkdir backups
fi

docker_db_dump() {
  echo "starting db backup"
  export MYSQLDB_BACKUP="mysql-init.sql"
  export MONGODB_BACKUP="mongo-init.dump"
  # ! TODO root folder specify
  # cd self-hosted
  # echo "${pwd}"
  $MAYBE_SUDO docker-compose exec mysqldb sh -c 'exec mysqldump --user $MONGO_INITDB_ROOT_USERNAME --password=$DHQ_MYSQL_PASSWORD --databases $DHQ_AUDIT_LOG_MYSQL_DATABASE $MYSQL_DATABASE --routines --triggers --events' >$1/${MYSQLDB_BACKUP}
  $MAYBE_SUDO docker-compose exec mongodb sh -c 'exec mongodump -d $DHQ_MONGODB_DATABASE -u $DHQ_MONGODB_USER -p $DHQ_MONGODB_PASSWORD  --authenticationDatabase admin  --archive' >$2/${MONGODB_BACKUP}
}
create_zip() {
  echo "====================zip creation started==============="
  TIMESTAMP=$(date +%s)
  DIRNAME="backup_${TIMESTAMP}"
  # cd $INSTALL_DIRECTORY
  mkdir -p backups/${DIRNAME}/{init/mongodump/db5x_studio,storage}
  cp -R ./storage/files backups/${DIRNAME}/storage
  cp -R ./{docker-compose.yml,dronahq.env,nginx.conf,certbot-docker-compose.yml} backups/${DIRNAME}
  cp -R ./init/{mongo-init.sh,my.cnf,nginx.conf,nginx-ssl-default.conf} backups/${DIRNAME}/init

  docker_db_dump "backups/${DIRNAME}/init" "backups/${DIRNAME}/init/mongodump/db5x_studio"

  $MAYBE_SUDO tar -czvf backups/${DIRNAME}.tar.gz ./backups/${DIRNAME} --remove-files
  $MAYBE_SUDO rm -rf backup/${DIRNAME}
  echo "====================zip creation end==============="

}
create_zip