### Externalize database
By default, the DronaHQ Kubernetes installation uses remotely hosted managed database instances of MySQl and MongoDB to make it more maintainable, scalable and reliable. You can make your database DronaHQ ready by following database steps.
These instructions explain how to set up DronaHQ with an external database.

1. Move inside directory `external-database`
    
        cd external-database

2. Generate environment file which can store your credentials to be used with database scripts. You can choose to delete this environment file later. But it is neccessary to have it while running db scripts to reduce human error while typing credentials.

        bash generate-environment.sh

3. Restore data into remote database from DronaHQ dump files.
        
        bash initialize.sh

4. By default, DronaHQ need user in dfatabases with name `dronahq`. You can create this user using this script. You can choose your own user name. But you will need to set this user name using environment file.

        bash create-db-user.sh

5. Now your database is in sync with DronaHQ for begining with installation.
    