#!/bin/bash

# Create binary folder
mkdir "$HOME/bin"

# Install Python modules
pip install -r requirements.txt

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Install terraform
install_terraform () {
    LATEST=$(curl https://api.github.com/repos/hashicorp/terraform/releases | jq '.[0].tag_name' --raw-output)
    curl "https://releases.hashicorp.com/terraform/${LATEST:1}/terraform_${LATEST:1}_linux_amd64.zip" > terraform.zip
    unzip terraform.zip
    mv terraform $HOME/bin/terraform
    rm terraform.zip
}

install_terraform

# Install dotfiles

dotfile () {
    fname=$1

    # Remove if it exists already
    if [ -e "$HOME/$fname" ]; then
        rm -rf "$HOME/$fname"
    fi

    # Create folder(s) if need be
    if echo $fname | grep / 2>/dev/null; then
        mkdir -p $(dirname "$HOME/$fname")
    fi

    ln -s "$(pwd)/$1" "$HOME/$1"
}

dotfile .bashrc
dotfile .config/starship.toml