#!/bin/bash

# Install Lazydocker

# Get the latest version tag of Lazydocker release from GitHub and assign it to a variable
LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

# Download the Lazydocker archive from the releases page of the repository
curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"

# Unzip the archive
mkdir lazydocker-temp
tar xf lazydocker.tar.gz -C lazydocker-temp

# Move the binary file to /usr/local/bin directory
sudo mv lazydocker-temp/lazydocker /usr/local/bin

# Check Lazydocker version
lazydocker --version

# Clean up - remove the archive and temporary directory
rm -rf lazydocker.tar.gz lazydocker-temp

# Add alias for Bash
echo "alias lzd='lazydocker'" >> ~/.bashrc

# Check if Zsh is installed
if [ -n "$(command -v zsh)" ]; then
    # Add alias for Zsh
    echo "alias lzd='lazydocker'" >> ~/.zshrc
fi
