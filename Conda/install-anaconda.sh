#!/bin/bash

get_latest_anaconda_version() {
    wget -qO- https://repo.anaconda.com/archive/ | \
    grep -oP 'Anaconda3-\K[0-9]+\.[0-9]+-[0-9]+' | \
    sort -V | tail -n 1
}

ANACONDA_VERSION=$(get_latest_anaconda_version)

if [ -z "$ANACONDA_VERSION" ]; then
    echo "Error: Could not determine the latest Anaconda version."
    exit 1
fi

INSTALL_DIR="$HOME/anaconda3"

INSTALLER="Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh"
INSTALLER_URL="https://repo.anaconda.com/archive/$INSTALLER"

echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "Downloading Anaconda version: $ANACONDA_VERSION..."
wget $INSTALLER_URL -O Downloads/$INSTALLER

if [ $? -ne 0 ]; then
    echo "Error: Failed to download Anaconda version $ANACONDA_VERSION. Please check your internet connection or try another version."
    exit 1
fi

echo "Installing Anaconda..."
bash Downloads/$INSTALLER -b -p $INSTALL_DIR

echo "Initializing Anaconda..."
$INSTALL_DIR/bin/conda init

echo "Applying changes..."
source ~/.bashrc

echo "Anaconda installation is complete! Please restart your terminal."

