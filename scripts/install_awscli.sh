#!/bin/bash

install_awscli () {
    curl --location "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    ./aws/install -i $HOME/.aws-cli -b $HOME/bin
    rm -rf aws awscliv2.zip
}

install_awscli