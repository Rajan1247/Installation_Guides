#!/bin/bash

MINICONDA_VERSION="latest"
INSTALL_DIR="$HOME/miniconda3"
INSTALLER="Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh"
INSTALLER_URL="https://repo.anaconda.com/miniconda/$INSTALLER"

echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "Downloading Miniconda installer..."
wget $INSTALLER_URL -O Downloads/$INSTALLER

echo "Installing Miniconda..."
bash Downloads/$INSTALLER -b -p $INSTALL_DIR

echo "Initializing Conda..."
$INSTALL_DIR/bin/conda init

echo "Applying changes..."
source ~/.bashrc

echo "Miniconda installation is complete! Please restart your terminal."
