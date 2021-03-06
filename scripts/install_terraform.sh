#!/bin/bash

install_terraform () {
    LATEST=$(curl https://api.github.com/repos/hashicorp/terraform/releases | jq '.[0].tag_name' --raw-output)
    curl --location "https://releases.hashicorp.com/terraform/${LATEST:1}/terraform_${LATEST:1}_linux_amd64.zip" > terraform.zip
    unzip terraform.zip
    mv terraform $HOME/bin/terraform
    rm terraform.zip
}

install_terraform