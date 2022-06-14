#!/bin/bash

set -e

mongo <<EOF

use admin

db.createUser({
  user: '$MONGO_INITDB_USER',
  pwd: '$MONGO_INITDB_PWD',
  roles: [{
    role: "userAdminAnyDatabase",
    db: "admin"
  }, {
    role: 'readWrite',
    db: 'db5x_studio'
  }]
})

EOF

mongorestore /mongodump
