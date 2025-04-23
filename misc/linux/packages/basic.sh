#!/usr/bin/env bash

sudo dnf update
sudo dnf -y install \
    jq \
    git \
    curl \
    tree \
    stow \
    xclip \
    pdftk \
    rlwrap \
    direnv \
    ripgrep \
    openjdk-21-jdk 

sudo dnf copr enable birkch/dbeaver
sudo dnf install dbeaver-ce 
sudo dnf copr enable pgdev/ghostty
sudo dnf install ghostty

