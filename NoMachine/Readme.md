# NoMachine Installation 

## Summary
- This Repository is a guide to install the Nomachine in Linux-x86_64,ARM Devices, Raspberry Pi and Windows System. NoMachine is a remote desktop tool just like VNC but it is faster. The NX protocol provides near-local speed responsiveness over high latency and low bandwidth links. So it feels like you were directly in front of your computer.
- It contains the guides about installation of following tools.
  - **Nomachine**

<details>

<summary><b>Table of Contents</b></summary>

- **[Downlaod](#download)**
- **[Installation](#installation)**
  - [Linux](#linux)
  - [Windows](#windows)

</details>

## Downlaod
Download the No Machine `.deb` file for **Linux-x86_64** or **ARM Devices(aarch64)** or `.exe` file for **Windows** by clicking the links below. (Version 8.14.2_1 as of this writing)

[Linux-x86_64 (Ubuntu 22.04)](https://download.nomachine.com/download/8.14/Linux/nomachine_8.14.2_1_amd64.deb) | [ARM Devices (ARM64)](https://download.nomachine.com/download/8.14/Arm/nomachine_8.14.2_1_arm64.deb) | [Raspberry Pi 4 and 5 (ARMv7)](https://download.nomachine.com/download/8.14/Raspberry/nomachine_8.14.2_1_armhf.deb) | [Raspberry Pi 4 and 5 (ARMv8)](https://download.nomachine.com/download/8.14/Raspberry/nomachine_8.14.2_1_arm64.deb) |[Windows (64-bits)](https://download.nomachine.com/download/8.14/Windows/nomachine_8.14.2_2_x64.exe)

Or check the [No Machine Download Page](https://downloads.nomachine.com/) to download the latest version. And download the No Machine file as per you system architecture.


## Installation

### Linux

1. (Only if not downlaoded earlier with [No Machine Download Page](https://downloads.nomachine.com/)) To download the `.deb` (Version 8.14.2_1) file with `Terminal` run the following command:
    - Linux-x86_64 (Ubuntu 22.04)
    ```bash
    wget https://download.nomachine.com/download/8.14/Linux/nomachine_8.14.2_1_amd64.deb
    ```
    - ARM Devices(ARM64)
    ```bash
    wget https://download.nomachine.com/download/8.14/Arm/nomachine_8.14.2_1_arm64.deb
    ```
    - Raspberry Pi 4 and 5 (ARMv7)
    ```bash
    wget https://download.nomachine.com/download/8.14/Raspberry/nomachine_8.14.2_1_armhf.deb
    ```
    - Raspberry Pi 4 and 5 (ARMv8)
    ```bash
    wget https://download.nomachine.com/download/8.14/Raspberry/nomachine_8.14.2_1_arm64.deb
    ```
2. After downloading the `.deb` file, open the terminal in the directory where the downloaded file is located. Run the following command to install the NoMachine.
    ```bash
    sudo dpkg -i nomachine_<version_architecture>.deb 
    ```

    Linux-x86_64 (Ubuntu 22.04)
    ```bash
    sudo dpkg -i nomachine_8.14.2_1_amd64.deb 
    ```

    ARM Devices (ARM64) and Raspberry Pi 4 and 5 (ARMv8)
    ```bash
    sudo dpkg -i nomachine_8.14.2_1_arm64.deb 
    ```

    Raspberry Pi 4 and 5 (ARMv7)
    ```bash
    sudo dpkg -i nomachine_8.14.2_1_armhf.deb 
    ```

### Windows
After downloading the installer, install it by double-clicking on the icon of the executable file.
A setup wizard will take you through the installation.

1. Welcome to the installer! Click on Next to start the installation.
2. Read and accept the License Agreement and click Next to go on.
3. Click Next to proceed and please wait while Setup completes the installation … You can then select where to install NoMachine or let the default location as it is.
- `Reboot` is Mandatory to complete the installation.
4. Accept to reboot your machine to complete the installation and exit the Installer.