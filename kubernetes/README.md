# Deploy DronaHQ with Kubernetes
Learn how to deploy DronaHQ with Kubernetes.

You can deploy self-hosted DronaHQ on Kubernetes following the instructions in this guide.

## Requirements
To deploy DronaHQ on Kubernetes, you need:

- A DronaHQ license key, which you can obtain from [DronaHQ Self-Hosted Portal](https://studio.dronahq.com/selfhosted/login).
- A domain you own, to which you can add a DNS record.
- A Kubernetes cluster. To create a cluster, see documentation on [Google Cloud Platform](https://cloud.google.com/kubernetes-engine/docs/how-to/creating-a-zonal-cluster), [AWS](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html), and [Azure](https://learn.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-cluster?tabs=azure-cli).
- A working installation of kubectl. To install kubectl, see documentation on [Google Cloud Platform](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl#generate_kubeconfig_entry), [AWS](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html), and [Azure](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli#connect-to-the-cluster).

### Cluster size
The cluster must have at least one node with 2x vCPUs and 4 GB of memory. Use the following command to retrieve the capacity of your nodes.


    $ kubectl describe nodes

In the Capacity section, verify the cpu and memory values meet the above requirements.

    Capacity:
        cpu:                2
        ephemeral-storage:  20134592Ki
        hugepages-1Gi:      0
        hugepages-2Mi:      0
        memory:             3944424Ki
        pods:               17
    Allocatable:
        cpu:                1930m
        ephemeral-storage:  17482298133
        hugepages-1Gi:      0
        hugepages-2Mi:      0
        memory:             3389416Ki
        pods:               17

### Cluster storage class
If you want to [mount volumes](#mount-volumes), ensure the volume supplied by your cloud provider can be mounted to multiple nodes. To identify your cluster's storage class, run the command

    $ kubectl get storageclass

Reference your cloud provider's documentation to verify that this storage class supports the ReadWriteMany access mode.

## 1. Clone manifests
DronaHQ's Kubernetes deployment is configured using a [set of manifests](https://github.com/dronahq/self-hosted/kubernetes). To retrieve a copy of the manifests, download the dronahq-self-hosted repository to your local machine. Open the kubernetes directory in an IDE to follow along the steps below.

    curl -L -O https://license.dronahq.com/self-hosted/master.zip && unzip master.zip
    cd master/kubernetes

## 2. Configure version
In `dronahq-webapp.yaml`, change the image tag to indicate the [version of DronaHQ](https://hub.docker.com/r/dronahq/self-hosted/tags) to install. The following example specifies the image tag to install version 2.2.7.

    image: dronahq/self-hosted:2.2.7

## 3. Configure secrets
Copy the `dronahq-secrets.template.yaml` file to a new file named `dronahq-secrets.yaml`. This file sets the configuration options for your deployment, and stores them as [Kubernetes secrets](https://kubernetes.io/docs/concepts/configuration/secret/).

    cp dronahq-secrets.template.yaml dronahq-secrets.yaml

Set the configuration options for your instance. Note that values in this file need to be encoded in `base64`.

> Use simple echo command to convert your text to base64 encoded string
>
> `echo -n 'super-secret-password' | base64`

<!-- > 📘 Use `openssl` for base64 encoded string generation
>
> To generate 36-character random strings, encoded in base64, run the command `$ openssl rand -base64 36`. -->

By default, user name for databases is set to `dronahq`, you  can change it using [environment variables](https://github.com/dronahq/self-hosted/blob/main/EnvironmentVariables.md).

Set the following values in `dronahq-secrets.yaml`:

| Setting | Description |
| --- | ----------- |
| license_key | base64 encoded dronahq license key. |
| mysql_host | base64 encoded mysql server address or domain name |
| mysql_password | base64 encoded mysql password for selected user |
| mongodb_host | base64 encoded mongodb server address or domain name |
| mongodb_password | base64 encoded mongodb password for selected user |
| aws_s3_region | base64 encoded s3 bucket name you want to use |
| aws_s3_access_key_id | base64 encoded access key id to use selected bucket |
| aws_s3_access_key_secret | base64 encoded sectret key pair for selected access key |
| aws_s3_bucket_name | base64 encoded aws s3 bucket name |

## 4. Install DronaHQ
After updating the configuration, install DronaHQ. Run the following commands in sequence.

    kubectl apply -f ./dronahq-secrets.yaml
    kubectl apply -f ./dronahq-webapp.yaml
    kubectl apply -f ./load-balancer.yaml

After installing DronaHQ, verify you have pod for the `webapp`.

    $ kubectl get pods

    NAME                                     READY   STATUS    RESTARTS      AGE
    webapp-63452e7643-si4g5                  1/1     Running   1 (2h ago)    8h

Once the pod is running, verify the installation by port forwarding to `localhost`.

    kubectl port-forward webapp-63452e7643-si4g5 8080:8080

You can then access DronaHQ at `http://localhost:8080/`.

## Additional steps
You need to externalize your database to a remote host. DronaHQ strongly recommends you to configure SSL, and keep up-to-date with the latest version of DronaHQ. Setting environment variables is often necessary to configure self-hosted features.

### Externalize database
By default, the DronaHQ Kubernetes installation uses remotely hosted managed database instances of MySQL and MongoDB to make it more maintainable, scalable and reliable. You can make your database DronaHQ ready by following database steps.
These instructions explain how to set up DronaHQ with an external database.

1. Move inside directory `external-database`
    
        cd external-database

2. Generate environment file which can store your credentials to be used with database scripts. You can choose to delete this environment file later. But it is neccessary to have it while running db scripts to reduce human error while typing credentials.

        bash generate-environment.sh

3. Restore data into remote database from DronaHQ dump files.

        bash initialize.sh

4. By default, DronaHQ need user in dfatabases with name `dronahq`. You can create this user using this script. You can choose your own user name. But you will need to set this user name using environment file.

        bash create-db-user.sh
    
5. Encrypt your database passwords.

        echo -n <password> | base64

3. In `dronahq-secrets.yaml`, set the value of `mysql_password` and `mongodb_password` as the base64 encoded password.

4. (optional) In `dronahq-webapp.yaml`, set the MySQLand MongoDB credentials to the credentials of your managed database instance. You do not need to specify `host` and `password`, since that value is pulled from the secret you already configured.

        - name: DHQ_MYSQL_USER
          value: <mysql-user>
        - name: DHQ_MYSQL_PORT
          value: <mysql-port>
        - name: DHQ_MONGODB_USER
          value: <mongodb-user>
        - name: DHQ_MONGODB_PORT
          value: <mongodb-port>

6. Apply changes to the two manifests.

        kubectl apply -f dronahq-secrets.yaml
        kubectl apply -f dronahq-webapp.yaml

### Update DronaHQ
1. Back up your database. If you use a managed database service, your database provider may have a feature to take snapshots or otherwise back up your database. 

2. Identify the appropriate release version on [Docker Hub](https://hub.docker.com/r/dronahq/self-hosted). See DronaHQ's self-hosted [release notes](https://community.dronahq.com/t/dronahq-self-hosted-releases/1177) to learn about version-specific features.

4. Take database updates for selected version from DronaHQ. Get inside directory `external-database` and run `db-update.sh` file. This is interactive shell and will help you get database updates for selected version.

5. In `dronahq-webapp.yaml`, change the image tag to indicate the [version of DronaHQ](https://hub.docker.com/r/dronahq/self-hosted/tags) to install. The following example specifies the `image` tag to install version 2.2.7.

        image: dronahq/self-hosted:2.2.7

6. Apply changes to the manifest.

        kubectl apply -f dronahq-webapp.yaml

7. Verify that your pods is running.

        $ kubectl get pods

        NAME                                     READY   STATUS    RESTARTS      AGE
        webapp-63452e7643-si4g5                     1/1     Running   1 (8h ago)   8h

### Add environment variables
[Environment variables](https://github.com/dronahq/self-hosted/blob/main/EnvironmentVariables.md) provide ways to configure a DronaHQ instance.

1. Add the environment variable to `dronahq-webapp.yaml`. This example sets the `SECURE_HTTP` variable, but this pattern applies to other environment variables as well.

        env:
          - name: SECURE_HTTP
            value: true

2. Apply the changes to the manifest.

        kubectl apply -f dronahq-webapp.yaml

3. Verify that your pod is running.

        $ kubectl get pods

        NAME                                     READY   STATUS    RESTARTS      AGE
        webapp-63452e7643-si4g5                     1/1     Running   1 (8h ago)   8h

### Mount volumes
There are several use cases which require the use of [volumes](https://kubernetes.io/docs/concepts/storage/volumes/). For example, when configuring a gRPC resource, you need to mount a volume containing the protos files to the DronaHQ deployment. Follow these instructions to create a persistent volume and copy files from your local machine to the volume.

#### 1. Set security context
In a later step, you use [kubectl cp](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#cp) to copy files from your local machine to the Kubernetes cluster, which requires the pod to run with root privileges. Modify your deployment so the pods run as root by adding the `securityContext` in your `dronahq-webapp.yaml` file:

    spec:
        securityContext:
            runAsUser: 0
            fsGroup: 2000

Apply changes to the manifest.

    kubectl apply -f dronahq-webapp.yaml

Verify that your pods is in a ready state before continuing.

    $ kubectl get pods

    NAME                                     READY   STATUS    RESTARTS      AGE
    webapp-63452e7643-si4g5                     1/1     Running   1 (8h ago)   8h

#### 2. Copy files
Next, copy the `protos` files from your local machine to the PVC. Ensure you local machine has a folder named protos and run the following command. Replace `webapp-63452e7643-si4g5` with the name of your main DronaHQ container, retrieved from `kubectl get pods`.

    kubectl cp protos/ webapp-63452e7643-si4g5:/dronahq_backend/pv-data/protos

#### 3. Set directory path
If you're configuring gRPC, specify the location of the protos directory. In `dronahq-webapp.yaml`, set the `PROTO_DIRECTORY_PATH` environment variable.

    env:
      - name: PROTO_DIRECTORY_PATH
        value: "/dronahq_backend/pv-data/protos"

#### 4. Reset security context
Reset the security context of your deployment by removing the `securityContext` field, or by defining a non-root user.

Apply changes to the manifest.

    kubectl apply -f dronahq-webapp.yaml

### Configure SSL
1. Get a domain for DronaHQ installation from your `name server`.

2. Log in to `AWS Console`, and open `AWS Certificate Manager`. from here generate SSL certificate for your domain. To generate public certificate, you can follow [AWS ACM docs](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html)

3. open manifets `load-balancer.yaml` and add `ARN` of yor generated certificate in field `service.beta.kubernetes.io/aws-load-balancer-ssl-cert`.

        kind: Service
        metadata:
        labels:
            app: webapp-lb
        name: webapp-lb
        annotations:
            service.beta.kubernetes.io/aws-load-balancer-ssl-cert: "arn:aws:acm:region:account:certificate/certificate_ID"

4. Apply the changes to your manifest.

        $ kubectl apply -f load-balancer.yaml

5. After the configugration updates, you can access the page in your browser using TLS.
