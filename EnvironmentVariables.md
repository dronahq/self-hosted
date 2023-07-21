# Environment variables
Environment variables for Self-hosted DronaHQ deployments.

Environment variables control or override certain functions and characteristics of [Self-hosted DronaHQ](https://github.com/dronahq/self-hosted) instances. Some DronaHQ features require you to set environment variables.

You should only configure environment variables when needed. You must restart your instance after setting any variables for them to take effect.

## General
General environment variables available for use with Self-hosted DronaHQ deployments.

#### `BUILDER_URL` (depricated)

The full URL of your DronaHQ deployment for accesing creators portal, End-user portal, user invitations and password resets. This also needs to be set if you dynamically set callback URLs on protected resources.

    BUILDER_URL='https://dronahq.example.com'

If unset, DronaHQ determine the base domain automatically from your local machine with port number.

    BUILDER_URL='http://localhost:8080'

You can use `DOMAIN` & `SECURE_HTTP` variable pair instead of `BUILDER_URL`

#### `DOMAIN`
This is your domain name or DNS owned by you, which you can set to your self hosted installations.

    DOMAIN='dronahq.example.com'

#### `SECURE_HTTP`

This variable specifies you want to use your self hosted installation over SSL. 
If set `true`, system will access above `DOMAIN` with `https` protocol
If not set, system will access above `DOMAIN` with `http` protocol. with this, you may not be able to access resources with `SSL` enabled.

    SECURE_HTTP='false'

#### `LICENSE_KEY`
This is a unique key assigned to you by DronaHQ. you can get by logging in to [Self-Hosted Portal](https://studio.dronahq.com/selfhosted/login).

#### `DHQ_SELF_HOSTED_LICENSE_URL` (optional)

For activation and licensing of your self hosted installation, DronaHQ needs to communicate with its in house licensing server hosted on `license.dronahq.com` with public IP as `52.203.193.48`. If you are working in closed intranet environment then you need to whitelist this domain for `outbound traffic`. Optionally you can set-up a proxy to DronaHQ's licensing system and update your proxy url here.

    DHQ_SELF_HOSTED_LICENSE_URL='https://license.dronahq.com'

### Connectivity to MySQL (for DronaHQ)

Provide your database credentials for DronaHQ self hosted. Your installation will access this database and read/write into it. to store information about resources used for building apps and some meta information.

#### `DHQ_MYSQL_HOST`, `DHQ_MYSQL_PORT`, `DHQ_MYSQL_USER`, `DHQ_MYSQL_PASSWORD`

If you are using Docker container for mysql, then you should set these variables as folows

    DHQ_MYSQL_HOST='dronahq-self-hosted-mysqldb'
    DHQ_MYSQL_USER='<application user>'
    DHQ_MYSQL_PASSWORD='<password>'
    DHQ_MYSQL_PORT='3306'

if you are using RDS or any other managed MySQL service then you can set variables accordingly.

### Connectivity to MySQL (for Audit Logs - optional)
#### `DHQ_AUDIT_LOG_MYSQL_HOST`, `DHQ_AUDIT_LOG_MYSQL_PORT`, `DHQ_AUDIT_LOG_MYSQL_USER`, `DHQ_AUDIT_LOG_MYSQL_PASSWORD`

This are optional variables. If not set, DronaHQ will use same credentials you provided in above variables.

If you are using Docker container for mysql, then you should set these variables as folows

    DHQ_AUDIT_LOG_MYSQL_HOST='dronahq-self-hosted-mysqldb'
    DHQ_AUDIT_LOG_MYSQL_USER='<application user>'
    DHQ_AUDIT_LOG_MYSQL_PASSWORD='<password>'
    DHQ_AUDIT_LOG_MYSQL_PORT='3306'

if you are using RDS or any other managed MySQL service then you can set variables accordingly.

### Connectivity to MongoDB
#### `DHQ_MONGODB_HOST`, `DHQ_MONGODB_PORT`, `DHQ_MONGODB_USER`, `DHQ_MONGODB_PASSWORD`

If you are using Docker container for MongoDB, then you should set these variables as folows

    DHQ_MONGODB_HOST='dronahq-self-hosted-mongodb'
    DHQ_MONGODB_USER='<application user>'
    DHQ_MONGODB_PASSWORD='<password>'
    DHQ_MONGODB_PORT='27017'

if you are using DocumentDB or any other managed MongoDB service then you can set variables accordingly.

## File Repository
#### `FILE_UPLOAD_TYPE`
DronaHQ supports two options for storing your files.

- `repository`: Use in-built 'Local file repository'
- `aws`: Use AWS S3 as a file storage

if unset, 'Local file repository' will be used.

    FILE_UPLOAD_TYPE='repository'

### Local file repository configurations (optional)
#### `FILEREPOSITORY_STORAGE_LOCATION`
By default this is working directory for your installation. You can configure this location.

    FILEREPOSITORY_STORAGE_LOCATION=process.cwd()

#### `FILEREPOSITORY_STORAGE_PREFIX`
Prefix is like a file name. This will create a folder inside `FILEREPOSITORY_STORAGE_LOCATION`

    FILEREPOSITORY_STORAGE_PREFIX='files'

### Amazon Simple Storage Service (S3) configuration
You can use Amazon S3 as a File storage with DronaHQ. DronaHQ will upload your uploaded files and other resources. Also your published applications will get served from AWS S3.

#### `AWS_S3_BUCKET_NAME`
This is your Bucket, in which you want to store you files.

#### `AWS_S3_REGION`
This is your AWS region in which bucked it hosted/created.

#### `AWS_S3_ACCESS_KEY_ID`, `AWS_S3_ACCESS_KEY_SECRET`
`AccessKeyId` and `AccessKeySecret` is required to access your bucket and objects inside bucket.
It is recomended that you provide complete read/write access of your bucket to this key pair.


## [MYSQL Container](https://hub.docker.com/_/mysql)

When you start the mysql image, you can adjust the configuration of the MySQL instance by passing one or more environment variables on the docker run command line. Do note that none of the variables below will have any effect if you start the container with a data directory that already contains a database: any pre-existing database will always be left untouched on container startup.

See also https://dev.mysql.com/doc/refman/5.7/en/environment-variables.html for documentation of environment variables which MySQL itself respects (especially variables like MYSQL_HOST, which is known to cause issues when used with this image).

#### `MYSQL_ROOT_PASSWORD`
This variable is mandatory and specifies the password that will be set for the MySQL root superuser account. In the above example, it was set to my-secret-pw.

#### `MYSQL_DATABASE`
This variable is optional and allows you to specify the name of a database to be created on image startup. If a user/password was supplied (see below) then that user will be granted superuser access (corresponding to GRANT ALL) to this database.

#### `MYSQL_USER`, `MYSQL_PASSWORD`
These variables are optional, used in conjunction to create a new user and to set that user's password. This user will be granted superuser permissions (see above) for the database specified by the MYSQL_DATABASE variable. Both variables are required for a user to be created.

Do note that there is no need to use this mechanism to create the root superuser, that user gets created by default with the password specified by the MYSQL_ROOT_PASSWORD variable.

#### `MYSQL_ALLOW_EMPTY_PASSWORD`
This is an optional variable. Set to a non-empty value, like yes, to allow the container to be started with a blank password for the root user. NOTE: Setting this variable to yes is not recommended unless you really know what you are doing, since this will leave your MySQL instance completely unprotected, allowing anyone to gain complete superuser access.

#### `MYSQL_RANDOM_ROOT_PASSWORD`
This is an optional variable. Set to a non-empty value, like yes, to generate a random initial password for the root user (using pwgen). The generated root password will be printed to stdout (GENERATED ROOT PASSWORD: .....).

#### `MYSQL_ONETIME_PASSWORD`
Sets root (not the user specified in MYSQL_USER!) user as expired once init is complete, forcing a password change on first login. Any non-empty value will activate this setting. NOTE: This feature is supported on MySQL 5.6+ only. Using this option on MySQL 5.5 will throw an appropriate error during initialization.

#### `MYSQL_INITDB_SKIP_TZINFO`
By default, the entrypoint script automatically loads the timezone data needed for the CONVERT_TZ() function. If it is not needed, any non-empty value disables timezone loading.


## [MongoDB Container](https://hub.docker.com/_/mongo)
When you start the `mongo` image, you can adjust the initialization of the MongoDB instance by passing one or more environment variables on the `docker run` command line. Do note that none of the variables below will have any effect if you start the container with a data directory that already contains a database: any pre-existing database will always be left untouched on container startup.

#### `MONGO_INITDB_ROOT_USERNAME`, `MONGO_INITDB_ROOT_PASSWORD`
These variables, used in conjunction, create a new user and set that user's password. This user is created in the admin authentication database and given the role of root, which is a "superuser" role.

The following is an example of using these two variables to create a MongoDB instance and then using the mongosh cli (use mongo with 4.x versions) to connect against the admin authentication database.

    $ docker run -d --network some-network --name some-mongo \
        -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
        -e MONGO_INITDB_ROOT_PASSWORD=secret \
        mongo

    $ docker run -it --rm --network some-network mongo \
        mongosh --host some-mongo \
            -u mongoadmin \
            -p secret \
            --authenticationDatabase admin \
            some-db
    > db.getName();
    some-db

Both variables are required for a user to be created. If both are present then MongoDB will start with authentication enabled (mongod --auth).

Authentication in MongoDB is fairly complex, so more complex user setup is explicitly left to the user via /docker-entrypoint-initdb.d/ (see the Initializing a fresh instance and Authentication sections below for more details).

#### `MONGO_INITDB_DATABASE`
This variable allows you to specify the name of a database to be used for creation scripts in /docker-entrypoint-initdb.d/*.js (see Initializing a fresh instance below). MongoDB is fundamentally designed for "create on first use", so if you do not insert data with your JavaScript files, then no database is created.

#### `MONGO_INITDB_USER`, `MONGO_INITDB_PWD`

These are custom variables added by DronaHQ. This will create application user in your database while initializing MongoDB container.
DronaHQ runs following script while initializing container to create application users and and assign read/write access to them.

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

<!-- ## Other -->
