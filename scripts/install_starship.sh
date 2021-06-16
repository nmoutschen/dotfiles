#!/bin/bash

install_starship () {
    curl --location "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz" > starship.tar.gz
    tar xvf starship.tar.gz
    mv starship $HOME/bin/starship
    rm starship.tar.gz
}

install_starship
