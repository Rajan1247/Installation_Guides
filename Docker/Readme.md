# Docker Engine Installation 

## Summary
- This Repository is a guide to install the Docker Engine for Linux-x86_64 system and Docker Desktop for Windows System. Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run.
- It contains the guides about installation of following tools
  - **Docker Engine for Linux-x86_64**
  - **Docker Desktop for Windows**

<details>

<summary><b>Table of Contents</b></summary>

- **[System Requirements](#system-requirements)**
   - [Linux-x86_64 System](#linux-x86_64-system)
   - [Windows System](#windows-system)
- **[Installation](#installation)**
   - [Linux](#linux)
      - [Uninstalling the Old Versions](#uninstalling-the-old-versions)
      - [Doecker Installation Methods](#docker-installation-methods)
      - [Install using Docker's apt repository](#install-using-dockers-apt-repository)
      - [Install from a Package](#install-from-a-package)
      - [Install Using Convenience Script](#install-using-convenience-script)
   - [Windows](#windows)
- **[Uninstalling the Docker Engine](#uninstalling-the-docker-engine)**
- **[Linux post-installation steps for Docker Engine](#linux-post-installation-steps-for-docker-engine)**
   - [Manage Docker as a non-root user](#manage-docker-as-a-non-root-user)
   - [Configure Docker to start on boot with systemd](#configure-docker-to-start-on-boot-with-systemd)

</details>

## System Requirements
### Linux-x86_64 System
To install Docker Engine, You need the 64-bit version of one of these Ubuntu versions:
1. Ubuntu Noble 24.04 (LTS)
2. Ubuntu Jammy 22.04 (LTS)
3. Ubuntu Focal 20.04 (LTS)

### Windows System
- WSL version 1.1.3.0 or later.
- Windows 11 64-bit: Home or Pro version 22H2 or higher, or Enterprise or Education version 22H2 or higher.
- Windows 10 64-bit: Minimum required is Home or Pro 22H2 (build 19045) or higher, or Enterprise or Education 22H2 (build 19045) or higher.
- Turn on the WSL 2 feature on Windows. 

> To run Windows containers, you need Windows 10 or Windows 11 Professional or Enterprise edition. Windows Home or Education editions only allow you to run Linux containers.

Containers and images created with Docker Desktop are shared between all user accounts on machines where it is installed. This is because all Windows accounts use the same VM to build and run containers. Note that it is not possible to share containers and images between user accounts when using the Docker Desktop WSL 2 backend.

## Installation
### Linux
#### Uninstalling the Old Versions
Before you can install Docker Engine, you need to uninstall any conflicting packages. Distro maintainers provide unofficial distributions of Docker packages in APT. You must uninstall these packages before you can install the official version of Docker Engine.

Run the following command to uninstall all the conflicting packages:
```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

#### Docker Installation Methods
You can install Docker Engine in different ways, depending on your needs:

1. Setup and Install Docker from [Docker's apt repository](#install-using-dockers-apt-repository)
2. [Install Manually](#install-from-a-package)
3. Install using [Convenience Script](#install-using-convenience-script). Only recommended for testing and development environments.


#### Install using Docker's apt repository
Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.

1. Set up Docker's apt repository. Run the following command in terminal:
   ```bash
   # Add Docker's official GPG key:
   sudo apt-get update
   sudo apt-get install ca-certificates curl
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc

   # Add the repository to Apt sources:
   echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update
   ```
2. Install the Docker Packages. To install the latest version of Docker run the following command:
   ```bash
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

3. Verify that the Docker Engine installation is successful by running the hello-world image.
   ```bash
   sudo docker run hello-world
   ```

This command downloads a test image and runs it in a container. When the container runs, it prints a confirmation message and exits. If the docker is installed correctly and everything is fine, you will get the following output in the terminal:

   ```bash
   Hello from Docker!
   This message shows that your installation appears to be working correctly.

   To generate this message, Docker took the following steps:
   1. The Docker client contacted the Docker daemon.
   2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
      (amd64)
   3. The Docker daemon created a new container from that image which runs the
      executable that produces the output you are currently reading.
   4. The Docker daemon streamed that output to the Docker client, which sent it
      to your terminal.

   To try something more ambitious, you can run an Ubuntu container with:
   $ docker run -it ubuntu bash

   Share images, automate workflows, and more with a free Docker ID:
   https://hub.docker.com/

   For more examples and ideas, visit:
   https://docs.docker.com/get-started/
   ```

You have now successfully installed and started Docker Engine.

#### Install from a Package

If you can't use Docker's apt repository to install Docker Engine, you can download the deb file for your release and install it manually. You need to download a new file each time you want to upgrade Docker Engine.

1. Go to [Docker for Linux](https://download.docker.com/linux/ubuntu/dists/).
2. Select your Ubuntu version in the list.(In my case it is Jammy as I use Ubuntu 22.04)
3. Go to `pool/stable/` and select the applicable architecture (amd64, armhf, arm64, or s390x).
4. Download the following `deb` files for the Docker Engine, CLI, containerd, and Docker Compose packages:


- `containerd.io_<version>_<arch>.deb`
- `docker-ce_<version>_<arch>.deb`
- `docker-ce-cli_<version>_<arch>.deb`
- `docker-buildx-plugin_<version>_<arch>.deb`
- `docker-compose-plugin_<version>_<arch>.deb`

    or click the following links to download the latest versions of this `.deb` packages.(For Ubuntu 22.02 Jammy amd64)

- [Containerd.io_1.7.22-1](https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.7.22-1_amd64.deb)
- [Docker-ce_27.3.1-1](https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_27.3.1-1~ubuntu.22.04~jammy_amd64.deb)
- [Docker-ce-cli_27.3.1-1](https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_27.3.1-1~ubuntu.22.04~jammy_amd64.deb)
- [Docker-buildx-plugin_0.17.1-1](https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-buildx-plugin_0.17.1-1~ubuntu.22.04~jammy_amd64.deb)
- [Docker-compose-plugin_2.29.7-1](https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.29.7-1~ubuntu.22.04~jammy_amd64.deb)

5. Install all the `.deb` packages with the following commnad. Make sure to update the package_name to the pacckage you want to install:
   ```bash
   sudo dpkg -i <package_name>
   ```

6. Verify that the Docker Engine installation is successful by running the hello-world image.
   ```bash
   sudo service docker start
   sudo docker run hello-world
   ```
This command downloads a test image and runs it in a container. When the container runs, it prints a confirmation message as below and exits.

   ```bash
   Hello from Docker!
   This message shows that your installation appears to be working correctly.

   To generate this message, Docker took the following steps:
   1. The Docker client contacted the Docker daemon.
   2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
      (amd64)
   3. The Docker daemon created a new container from that image which runs the
      executable that produces the output you are currently reading.
   4. The Docker daemon streamed that output to the Docker client, which sent it
      to your terminal.

   To try something more ambitious, you can run an Ubuntu container with:
   $ docker run -it ubuntu bash

   Share images, automate workflows, and more with a free Docker ID:
   https://hub.docker.com/

   For more examples and ideas, visit:
   https://docs.docker.com/get-started/
   ```


You have now succesfully installed Docker Engine.


#### Install Using Convenience Script

Docker provides a convenience script at [Convenience Script](https://get.docker.com/) to install Docker into development environments non-interactively. The convenience script isn't recommended for production environments, but it's useful for creating a provisioning script tailored to your needs. 


Always examine scripts downloaded from the internet before running them locally. Before installing, make yourself familiar with potential risks and limitations of the convenience script:

- The script requires `root` or `sudo` privileges to run.
- The script attempts to detect your Linux distribution and version and configure your package management system for you.
- The script doesn't allow you to customize most installation parameters.
- The script installs dependencies and recommendations without asking for confirmation. This may install a large number of packages, depending on the current configuration of your host machine.
- By default, the script installs the latest stable release of Docker, containerd, and runc. When using this script to provision a machine, this may result in unexpected major version upgrades of Docker. Always test upgrades in a test environment before deploying to your production systems.
- The script isn't designed to upgrade an existing Docker installation. When using the script to update an existing installation, dependencies may not be updated to the expected version, resulting in outdated versions.

1. Download the Docker [Convenience Script](https://get.docker.com/) or run the following command to download the script:
   ```bash
   curl -fsSL https://get.docker.com -o install-docker.sh
   ```

2. Verify the Script content:
   ```bash
   cat install-docker.sh
   ```

3. Run the script with --dry-run to verify the steps it executes. You can run the script with the --dry-run option to learn what steps the script will run when invoked:
   ```bash
   sudo sh ./install-docker.sh --dry-run
   ```

4. Run the script either as root, or using sudo to perform the installation.
   ```bash
   sudo sh install-docker.sh
   ```

You have now successfully installed and started Docker Engine. The docker service starts automatically on Debian based distributions. You can verify the installation by running `hello-world` as specified in above 2 methods.

### Windows
1. Download the installer for Docker Desktop by visiting the [Official Docker Website](https://docs.docker.com/desktop/setup/install/windows-install/) or by clicking on [Docker Desktop for Windows - x86_64](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64&_gl=1*1sm22ko*_gcl_au*NDU1MTA0OTQzLjE3MzA5ODI2MzY.*_ga*MjUyMjY0ODA1LjE3MzA5ODAwMTU.*_ga_XJWPQMJYHQ*MTczMTA0MTAxMC40LjEuMTczMTA0MzIxNC42MC4wLjA.).

2. Double-click Docker Desktop Installer.exe to run the installer. By default, Docker Desktop is installed at `C:\Program Files\Docker\Docker`.

3. When prompted, ensure to Use `WSL 2` instead of `Hyper-V` option on the Configuration page is selected or not depending on your choice of backend.

    - If your system only supports one of the two options, you won't be able to select which backend to use.

4. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.

5. When the installation is successful, select Close to complete the installation process.



## Uninstalling the Docker Engine

1. Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages:
   ```bash
   sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
   ```

2. Images, containers, volumes, or custom configuration files on your host aren't automatically removed. To delete all images, containers, and volumes:
   ```bash
   sudo rm -rf /var/lib/docker
   sudo rm -rf /var/lib/containerd
   ```

You have to delete any edited configuration files manually.

## Linux post-installation steps for Docker Engine
### Manage Docker as a non-root user
The Docker daemon binds to a Unix socket, not a TCP port. By default it's the root user that owns the Unix socket, and other users can only access it using sudo. The Docker daemon always runs as the root user.

If you don't want to preface the docker command with sudo, create a Unix group called docker and add users to it. When the Docker daemon starts, it creates a Unix socket accessible by members of the docker group. On some Linux distributions, the system automatically creates this group when installing Docker Engine using a package manager. In that case, there is no need for you to manually create the group.

When you try to run the Docker commands without using the root as shown below
```bash
docker images hello-world
```
You will get the following error:
```bash
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Head "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied
```

1. Create the docker group. In Ubuntu most of the case the docker group is already created.
   ```bash
   sudo groupadd docker
   ```

   - If the docker group is already created during installtion you will get the following output, which means the group is already exist:
      ```bash
      groupadd: group 'docker' already exists
      ```

2. Add your user to the docker group.
   ```bash
   sudo usermod -aG docker $USER
   ```

3. Log out and log back in so that your group membership is re-evaluated. Or You can also run the following command to activate the changes to groups:
   ```bash
   newgrp docker
   ```

4. Verify that you can run docker commands without sudo.
   ```bash
   docker run hello-world
   ```
This command downloads a test image and runs it in a container. When the container runs, it prints a message and exits.


### Configure Docker to start on boot with systemd

Many modern Linux distributions use systemd to manage which services start when the system boots. On Debian and Ubuntu, which uses GRUB boot manager, the Docker service starts on boot by default. To automatically start Docker and containerd on boot for other Linux distributions using systemd, run the following commands:
```bash
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

To stop this behavior, use disable instead.
```bash
sudo systemctl disable docker.service
sudo systemctl disable containerd.service
```