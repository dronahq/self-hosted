<p align="center">
    <a href="https://dronahq.com/"><img src="https://cdn1.dronahq.com/wp-content/uploads/2019/02/Dronahq-logo.svg" alt="DronaHQ logo" height="50"></a> <br>
    <b>Build stunning internal tools, blazing fast.</b>
</p> <br>

DronaHQ offers a low-code platform to build internal tools. Drag-and-drop UI components and connect them to your databases and APIs to build your own tools, rapidly. Connects with Postgres, REST APIs, Firebase, Google Sheets, and 3rd party systems like Hubspot, Shopify, Razorpay, Asana, Freshdesk, Zendesk and more. Built by developers, for developers. Trusted by startups and Fortune 500s. Start a Free Trial.

# DronaHQ self-hosted solution

[DronaHQ self-hosted solution](https://www.dronahq.com/self-hosted-signup) ensures that all access to your data is managed within your own cloud environment. It also provides the flexibility to control how DronaHQ is setup within your infrastructure, the ability to configure logging, scaling, and access to enable custom SAML SSO using providers like Okta and Active Directory.

Releases are added and maintained on [DockerHub](https://hub.docker.com/r/dronahq/self-hosted/tags) and on [DronaHQ Community](https://community.dronahq.com/t/dronahq-self-hosted-releases)

## Single Deployments

### Machine Specs : Prerequisites
- Linux Virtual Machine
  - Ubuntu `20.04` or higher
- `2` vCPUs
- `8` GiB + of Memory
- `60` GiB + of Storage 
- Networking Requirements for Initial Setup:
  - `80` (http): for connecting to the server from the browser
  - `443` (https): for connecting to the server from the browser
  - `22` (SSH): To allow you to SSH into your instance and configure it
  - `8080` (DronaHQ): This is the default port DronaHQ runs on

### Deploy on Linux 
1. Run the command `git clone https://github.com/dronahq/self-hosted.git`.
1. Run the command `cd self-hosted` to enter the cloned repository's directory.
1. Edit the `docker-compose.yml` file using VIM (or other text editor) to set the version of DronaHQ you want to install. To do this, replace `X.Y.Z` in `image:dronahq/self-hosted:X.Y.Z` with your desired version. See [Select a DronaHQ version number](#select-a-dronahq-version-number) to help you choose a version.
1. Run `./install_sh.sh` to install  Docker and Docker Compose.
1. In your `.env` (this file is only created after running `./install_sh.sh`) add the following:

   ```docker
   # License key granted to you by DronaHQ
   LICENSE_KEY=YOUR_LICENSE_KEYs
   ```

1. Run `sudo docker-compose up -d` to start the DronaHQ server.
1. Run `sudo docker-compose ps` to make sure all the containers are up and running.
1. Navigate to your server's IP address in a web browser. DronaHQ should now be running on port `8080`.
1. Click Activate, since we're starting from a clean slate. The first user to create an account on an instance becomes the administrator.

### AWS Deploy With EC2

Spin up a new EC2 instance. If using AWS, use the following steps:

1. On AWS EC2 dashboard, Click **Launch Instance**.
1. Click **Select** for an Ubuntu instance with version `20.04` or higher.
1. Select an instance type of at least `t3.medium` and click **Next**.
1. Ensure you select the same VPC that also includes the Databases & API’s that you will want to connect to and click **Next**.
1. Increase the storage size to `60` GB or higher and click **Next**.
1. Optionally add some Tags (e.g. `app = dronahq`) and click **Next**. This makes it easier to find if you have a lot of instances.
1. Set the network security groups for ports `80`, `443`, `22` and `8080`, with sources set to `0.0.0.0/0` and `::/0`, and click **Review and Launch**. We need to open ports `80` (http) and `443` (https) so you can connect to the server from a browser, as well as port `22` (ssh) so that you can ssh into the instance to configure it and run DronaHQ. By default on a vanilla EC2, DronaHQ will run on port `8080`.
1. On the **Review Instance Launch** screen, click **Launch** to start your instance.
1. If you're connecting to internal databases, whitelist the VPS's IP address in your database.
1. From your command line tool, SSH into your EC2 instance.
1. Run the command `git clone https://github.com/dronahq/self-hosted.git`.
1. Run the command `cd self-hosted` to enter the cloned repository's directory.
1. Edit the `docker-compose.yml` file using VIM (or other text editor) to set the version of DronaHQ you want to install. To do this, replace `X.Y.Z` in `image:dronahq/self-hosted:X.Y.Z` with your desired version. See [Select a DronaHQ version number](#select-a-dronahq-version-number) to help you choose a version.
1. Run `./install_sh.sh` to install  Docker and Docker Compose.
1. In your `.env` (this file is only created after running `./install_sh.sh`) add the following:

   ```docker
   # License key granted to you by DronaHQ
   LICENSE_KEY=YOUR_LICENSE_KEYs
   ```

1. Run `sudo docker-compose up -d` to start the DronaHQ server.
1. Run `sudo docker-compose ps` to make sure all the containers are up and running.
1. Navigate to your server's IP address in a web browser. DronaHQ should now be running on port `8080`.
1. Click Activate, since we're starting from a clean slate. The first user to create an account on an instance becomes the administrator.

### GCP Deploy With Compute Engine Virtual Machine

1. On GCP Dashboard, Click the Compute Engine Resource and select VM Instances
1. select ‘Create Instance’ from the top menu
1. Create a new VM to these Specs
    - Ubuntu Operating System Version 20.04 LTS or higher
    - Storage Size 60 GB or higher
    - Ram 4 GB or Higher (e2-medium)
    - Optionally add Labels (eg app = dronahq)
1. Create Instance
1. Navigate via search to the VPC Network Firewall settings and be sure to add the following ports set to`0.0.0.0/0` and `::/0`
    - `80` (HTTP)
    - `443` (HTTPS)
    - `22` (SSH)
    - `8080` (DronaHQ access in browser)
1. If you're connecting to an internal database, be sure to whitelist the VPC’s ip address in your DB
1. SSH into your instance, or use the Google SSH Button to open a VM Terminal in a browser window.
1. Run Command `git clone https://github.com/dronahq/self-hosted.git`
1. Run Command `cd self-hosted`
1. Edit the Docker-Compose file using VIM (or other text editor) to specify your desired version number of DronaHQ. To do this, replace `X.Y.Z` in `image:dronahq/self-hosted:X.Y.Z` with your desired version. See [Select a DronaHQ version number](#select-a-dronahq-version-number) to help you choose a version.
1. Run the command `git clone https://github.com/dronahq/self-hosted.git`.
1. Run the command `cd self-hosted` to enter the cloned repository's directory.
1. Edit the `docker-compose.yml` file using VIM (or other text editor) to set the version of DronaHQ you want to install. To do this, replace `X.Y.Z` in `image:dronahq/self-hosted:X.Y.Z` with your desired version. See [Select a DronaHQ version number](#select-a-dronahq-version-number) to help you choose a version.
1. Run `./install_sh.sh` to install  Docker and Docker Compose.
1. In your `.env` (this file is only created after running `./install_sh.sh`) add the following:

   ```docker
   # License key granted to you by DronaHQ
   LICENSE_KEY=YOUR_LICENSE_KEYs
   ```

1. Run `sudo docker-compose up -d` to start the DronaHQ server.
1. Run `sudo docker-compose ps` to make sure all the containers are up and running.
1. Navigate to your server's IP address in a web browser. DronaHQ should now be running on port `8080`.
1. Click Activate, since we're starting from a clean slate. The first user to create an account on an instance becomes the administrator.

### Azure Deploy with Azure Virtual Machine

1. In the main Azure Portal, select Virtual Machine under Azure Services
1. Click the Create button and select Virtual Machine 
1. Select an image of Ubuntu 20.04 or higher
1. For instance size, select `Standard_D2s_v3 - 2 vcpus, 8 GiB memory`
1. Under the Networking tab, Ensure you select the same Virtual Network that also includes the Databases / API’s you will want to connect to and click **Next**.
1. Under the Networking tab, configure your network security group to contain the following ports. You may need to create a new Security group that contains these 4 ports (`80`, `443`, `22` and `8080`): 
    - `80` (http) and `443` (https) for connecting to the server from a browser 
    - `22` (ssh) to allow you to ssh into the instance and configure it
    - `8080` is the port that DronaHQ runs on by default
1. From your command line tool, SSH into your Azure instance.
1. Run the command `git clone https://github.com/dronahq/self-hosted.git`.
1. Run the command `cd self-hosted` to enter the cloned repository's directory.
1. Edit the `docker-compose.yml` file using VIM (or other text editor) to set the version of DronaHQ you want to install. To do this, replace `X.Y.Z` in `image:dronahq/self-hosted:X.Y.Z` with your desired version. See [Select a DronaHQ version number](#select-a-dronahq-version-number) to help you choose a version.
1. Run `./install_sh.sh` to install  Docker and Docker Compose.
1. In your `.env` (this file is only created after running `./install_sh.sh`) add the following:

   ```docker
   # License key granted to you by DronaHQ
   LICENSE_KEY=YOUR_LICENSE_KEYs
   ```

1. Run `sudo docker-compose up -d` to start the DronaHQ server.
1. Run `sudo docker-compose ps` to make sure all the containers are up and running.
1. Navigate to your server's IP address in a web browser. DronaHQ should now be running on port `8080`.
1. Click Activate, since we're starting from a clean slate. The first user to create an account on an instance becomes the administrator.

### Updating DronaHQ Self-Hosted

The latest DronaHQ releases can be pulled from Docker Hub. When you run an on-premise instance of DronaHQ, you’ll need to pull an updated image in order to get new features and fixes.

See more information on our different release channels and recommended update strategies in [our documentation](https://community.dronahq.com/t/updating-dronahq-self-hosted).


### Docker cheatsheet

Below is a cheatsheet for useful Docker commands. Note that you may need to prefix them with `sudo`.

| Command                                                                                         | Description                                                                                                                   |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `docker-compose up -d`                                                                          | Builds, (re)creates, starts, and attaches to containers for a service. `-d`allows containers to run in background (detached). |
| `docker-compose down`                                                                           | Stops and remove containers and networks                                                                                      |
| `docker-compose stop`                                                                           | Stops containers, but does not remove them and their networks                                                                 |
| `docker ps -a`                                                                                  | Display all Docker containers                                                                                                 |
| `docker-compose ps -a`                                                                          | Display all containers related to images declared in the `docker-compose` file.                                               |
| `docker logs -f <container_name>`                                                               | Stream container logs to stdout                                                                                               |
| `docker exec -it <container_name> psql -U <postgres_user> -W <postgres_password> <postgres_db>` | Runs `psql` inside a container                                                                                                |
| `docker kill $(docker ps -q)`                                                                   | Kills all running containers                                                                                                  |
| `docker rm $(docker ps -a -q)`                                                                  | Removes all containers and networks                                                                                           |
| `docker rmi -f $(docker images -q)`                                                             | Removes (and un-tags) all images from the host                                                                                |
| `docker volume rm $(docker volume ls -q)`                                                       | Removes all volumes and completely wipes any persisted data                                                                   |