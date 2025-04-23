#!/usr/bin/env bash

sudo apt upgrade
sudo apt install -y \
    jq \
    git \
    curl \
    tree \
    stow \
    xclip \
    pdftk \
    pandoc \
    rlwrap \
    direnv \
    ripgrep \
    openjdk-21-jdk \
    build-essential 

sudo snap install dbeaver-ce 
sudo snap install ghostty --classic

