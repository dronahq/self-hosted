#!/bin/bash

set -e

mongosh <<EOF

use admin

db.createUser({
  user: '$MONGODB_USER',
  pwd: '$MONGODB_PASSWORD',
  roles: [{
    role: "userAdminAnyDatabase",
    db: "admin"
  }, {
    role: 'readWrite',
    db: '$MONGO_INITDB_DATABASE'
  }]
})

EOF

mongorestore --archive < /mongo-init.dump
