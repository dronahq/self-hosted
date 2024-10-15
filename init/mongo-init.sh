#!/bin/bash

set -e

# Wait for MongoDB to be ready to accept connections
echo "Waiting for MongoDB to start..."
until mongosh --eval "print(\"waiting for connection\")"; do
  sleep 2
done

echo "MongoDB is ready!"

# Create the user
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

echo "User created successfully."

# Restore the database from the dump file
if [ -f /mongo-init.dump ]; then
  echo "Restoring MongoDB database from /mongo-init.dump..."
  mongorestore --archive < /mongo-init.dump
  echo "Database restored successfully."
else
  echo "No dump file found at /mongo-init.dump, skipping restore."
fi

echo "MongoDB initialization complete."
