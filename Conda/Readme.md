# Conda

## Introduction

Conda is an open source package manager, like apt on Debian derivatives, pip for Python. It is mostly used in the fields of data science, machine learning, artificial intelligence, scientific computing, etc.

There are three items that are referred to as "conda". They are as follows:

- Conda
- [Anaconda](#anaconda)
- [Miniconda](#miniconda)

Conda is the actual package manager, whereas Anaconda and Miniconda are the software distributions that include helpful software. So, you use the conda command to install packages that are provided by Anaconda or Miniconda.

## Installation

### Anaconda

Anaconda Distribution is a Python/R Data Science distribution that contains:

- **conda** - A package and environment manager for your command line interface.
- **Anaconda Navigator** - A desktop application built on conda, with options to launch other development applications from your managed environments.
- **Over 300 automatically** -installed packages that work well together out of the box.
- Access to the Anaconda Public Repository, with 8000 open-source data science and machine learning packages.


#### 1. Download the Script

- The Anaconda installer is offered as a shell script. To download the Anaconda Script visit the [Official Website](https://www.anaconda.com/download/success) and click on the downlaod button.
- If you want to download the other versions of the Anaconda you can visit the [Anaconda Archive Page](https://repo.anaconda.com/archive/) and choose the version you want to install.
- Alternatively you can [Click Here](https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh) to download the latest version of Anaconda Installer for x86_64 systems (Version - 2024.10-1 As per writing this).
- Or you can run the following command in your terminal to downlaod the Anaconda Instller using `wget`:

    ```bash 
    wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
    ```

#### 2. Verify the Script (Optional)

- Verifying the hash of any file allows you to determine if the file is an incomplete download or if you have a compromised file. You can find the hash for your file at [Anaconada Archive Page](https://repo.anaconda.com/archive/).
- To verify the checksum, use the following command:

    ```bash
    echo "HASH_OF_INSTALLER *INSTALLER_SCRIPT_NAME" | shasum --check
    ```

- For example, As I use Ubuntu 22.04 - x86_64 Architecture so I downloaded `Anaconda3-2024.10-1-Linux-x86_64.sh` and for the downloaded installer the hash is `3ba0a298155c32fbfd80cbc238298560bf69a2df511783054adfc151b76d80d8`. So, for that the above command will be like this:

    ```bash
    $ echo "3ba0a298155c32fbfd80cbc238298560bf69a2df511783054adfc151b76d80d8 *Anaconda3-2024.10-1-Linux-x86_64.sh" | shasum --check
    # OUTPUT:
    # Anaconda3-2024.10-1-Linux-x86_64.sh: OK
    ```
    > The above used Hash code might be different for you if you download the another version or Anaconda has released newer version. So, chnage the above command accordingly.

- If got an OK in the output this means that the hash matched and it is safe to use this file.

- If you see FAILED in the output, it means that something is wrong with the file. In that case, re-download the file and verify the hash again, until the hash matches.

#### 3. Execute the Installer

- Give the execution permission to the file with the following command:

    ```bash
    # chmod +x <file_name>
    chmod +x Anaconda3-2024.10-1-Linux-x86_64.sh
    ```

- Now execute the file with the following command:

    ```bash
    ./Anaconda3-2024.10-1-Linux-x86_64.sh
    ```
    > Please note that the file name can be different as which version of the Anaconda Installer you have downloaded.

- The Anaconda installer has an EULA, which you do need to agree in order to continue the installation. Continue pressing the `Enter` or the `Space Bar` to read the Terms of Service or you can press `q` to skip the Terms of Service. Type `yes` and press `Enter` to agree to the Terms.
- Once agreed, it will assume that the default installation location is `home/<user_name>/anaconda3`, but that can be changed here. If you want the Anaconda to install at different location just specify the path and press `Enter`.
- Next, the installer will **Do you wish to update your shell profile to automatically initialize conda?** This will activate conda on startup and change the command prompt when activated. To do so it will modify your `.bashrc` file so that the PATH variable contains the path to the software installed by Anaconda. Type `yes` and press `Enter`.

#### 4. Update the PATH variable (Optional)

- If you selected `no` in when the installer has asked **Do you wish to update your shell profile to automatically initialize conda?** you have to manually add the PATH in the `~/.bashrc` file.
- Open the `~/.bashrc` file with `sudo nano ~/.bashrc` and add the following lines at the end of the file:

    ```bash
    if ! [[ $PATH =~ "$HOME/anaconda3/bin" ]]; then
        PATH="$HOME/anaconda3/bin:$PATH"
    fi
    ```

- This checks if the `~/anaconda/bin` directory is present in the PATH variable. If the directory is not present, it is added to the PATH variable. Otherwise nothing is done. There are two ways to make this change come into effect:
    - Close the terminal and re-open it
    - Run the `source ~/.bashrc` command in the terminal
- This will re-read the `~/.bashrc` file and make sure that `~/anaconda3/bin` is present in the PATH variable.

#### 5. Verify the Installation

- Now whenever you open the Terminal by default the `base` environment is activated. That means the Anaconda is installed. You can run the following command to check the installed packages in the base environment.

    ```bash
    conda list
    ```

- If the `base` environment is not activated by default you can run the following command:

    ```bash
    source <path_to_installation>/anaconda3/bin/activate
    ```

    - If you instaled to the default location so you can run the following command:

        ```bash
        source anaconda3/bin/activate
        ```

- If you don't want to activate the `base` environment whenever you start the Terminal you can run the following command when the `base` environment is activate:

    ```bash
    conda config --set auto_activate_base false
    ```

- Now the `base` environment will not be activated everytime you open the Terminal. You have to manually activate the `base` environment whenever you want to use the conda with the following command:

    ```bash
    conda activate
    ```


### Miniconda

Miniconda is a free, miniature installation of Anaconda Distribution that includes only conda, Python, the packages they both depend on, and a small number of other useful packages.

You can use the `miniconda-install.sh` script to download and install the Miniconda. 
- [Click here](https://raw.githubusercontent.com/Rajan1247/Installation_Guides/tree/main/Conda/miniconda-install.sh) to download the script.
- Make the script executable with the following command:

    ```bash
    chmod +x miniconda-install.sh
    ```
- Run the script using the following command:

    ```bash
    ./miniconda-install.sh
    ```
- And wait till the instalation is completed. (You might be prompted for the user password.)

Alternatively, You can follow the below steps to install the Miniconda manually in your system.

#### 1. Download the Script

- The Miniconda installer is also offered as a shell script. To download the Miniconda Script visit the [Official Website](https://www.anaconda.com/download/success) and scroll down to the Miniconda Download Section and click on the architecture as per your requirment.
- If you want to download the other versions of the Anaconda you can visit the [Miniconda Archive Page](https://repo.anaconda.com/miniconda/) and choose the version you want to install.
- Alternatively you can [Click Here](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh) to download the latest version of Miniconda Installer for x86_64 systems.
- Or you can run the following command in your terminal to downlaod the Anaconda Instller using `wget`:

    ```bash 
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    ```

#### 2. Verify the Script (Optional)

- Verifying the hash of any file allows you to determine if the file is an incomplete download or if you have a compromised file. You can find the hash for your file at [Miniconada Archive Page](https://repo.anaconda.com/miniconda/).
- To verify the checksum, use the following command:

    ```bash
    echo "HASH_OF_INSTALLER *INSTALLER_SCRIPT_NAME" | shasum --check
    ```

- For example, As I use Ubuntu 22.04 - x86_64 Architecture so I downloaded `Miniconda3-latest-Linux-x86_64.sh` and for the downloaded installer the hash is `8d936ba600300e08eca3d874dee88c61c6f39303597b2b66baee54af4f7b4122`. So, for that the above command will be like this:

    ```bash
    $ echo "8d936ba600300e08eca3d874dee88c61c6f39303597b2b66baee54af4f7b4122 *Miniconda3-latest-Linux-x86_64.sh" | shasum --check
    # OUTPUT:
    # Miniconda3-latest-Linux-x86_64.sh: OK
    ```

    > The above used Hash code might be different for you if you download the another version or Miniconda has released newer latest version. So, chnage the above command accordingly.

- If got an OK in the output this means that the hash matched and it is safe to use this file.

- If you see FAILED in the output, it means that something is wrong with the file. In that case, re-download the file and verify the hash again, until the hash matches.

#### 3. Execute the Installer

- Give the execution permission to the file with the following command:

    ```bash
    # chmod +x <file_name>
    chmod +x Miniconda3-latest-Linux-x86_64.sh
    ```

- Now execute the file with the following command:

    ```bash
    ./Miniconda3-latest-Linux-x86_64.sh
    ```
    > Please note that the file name can be different as which version of the Miniconda Installer you have downloaded.

- Press `Enter` to continue.
- The Miniconda installer has an EULA, which you do need to agree in order to continue the installation. Continue pressing the `Enter` or the `Space Bar` to read the Terms of Service or you can press `q` to skip the Terms of Service. Type `yes` and press `Enter` to agree to the Terms.
- Once agreed, it will assume that the default installation location is `home/<user_name>/miniconda3`, but that can be changed here. If you want the Miniconda to install at different location just specify the path and press `Enter`.
- Next, the installer will **Do you wish to update your shell profile to automatically initialize conda?** This will activate conda on startup and change the command prompt when activated. To do so it will modify your `.bashrc` file so that the PATH variable contains the path to the software installed by Miniconda. Type `yes` and press `Enter` (Recommended).

#### 4. Update the PATH variable (Optional)

- If you selected `no` in when the installer has asked **Do you wish to update your shell profile to automatically initialize conda?** you have to manually add the PATH in the `~/.bashrc` file.
- Open the `~/.bashrc` file with `sudo nano ~/.bashrc` and add the following lines at the end of the file:

    ```bash
    if ! [[ $PATH =~ "$HOME/miniconda3/bin" ]]; then
        PATH="$HOME/miniconda3/bin:$PATH"
    fi
    ```

- This checks if the `~/miniconda/bin` directory is present in the PATH variable. If the directory is not present, it is added to the PATH variable. Otherwise nothing is done. There are two ways to make this change come into effect:
    - Close the terminal and re-open it
    - Run the `source ~/.bashrc` command in the terminal
- This will re-read the `~/.bashrc` file and make sure that `~/miniconda3/bin` is present in the PATH variable.

#### 5. Verify the Installation

- Now whenever you open the Terminal by default the `base` environment is activated. That means the Anaconda is installed. You can run the following command to check the installed packages in the base environment.

    ```bash
    conda list
    ```

- If the `base` environment is not activated by default you can run the following command:

    ```bash
    source <path_to_installation>/miniconda3/bin/activate
    ```

    - If you installed to the default location so you can run the following command:

        ```bash
        source miniconda3/bin/activate
        ```

- If you don't want to activate the `base` environment whenever you start the Terminal you can run the following command when the `base` environment is activate:

    ```bash
    conda config --set auto_activate_base false
    ```

- Now the `base` environment will not be activated everytime you open the Terminal. You have to manually activate the `base` environment whenever you want to use the conda with the following command:

    ```bash
    conda activate
    ```
