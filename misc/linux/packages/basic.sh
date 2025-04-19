#!/usr/bin/env bash

sudo apt upgrade
sudo apt install -y \
    jq \
    fzf \
    git \
    tmux \
    curl \
    tree \
    tidy \
    stow \
    shfmt \
    xclip \
    pdftk \
    rlwrap \
    direnv \
    ripgrep \
    fd-find \
    markdown \
    shellcheck \
    postgresql \
    texlive-full \
    libxml2-utils \
    inotify-tools \
    openjdk-21-jdk \
    libncurses-dev \
    build-essential \
    postgresql-contrib

sudo snap install dbeaver-ce
