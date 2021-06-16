#!/bin/bash

# Create binary folder
mkdir "$HOME/bin"

# Install Python modules
pip install -r requirements.txt &

# Install tools
./scripts/install_starship.sh &
./scripts/install_terraform.sh &
./scripts/install_awscli.sh &

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

# Setup AWS config
# Only run this if the AWS_CONFIG variable is set
if [ -n "$AWS_CONFIG" ]; then
    mkdir -p "$HOME/.aws"
    echo "$AWS_CONFIG" | ./scripts/json2ini.py > $HOME/.aws/config
fi