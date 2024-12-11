#!/usr/bin/env bash

sudo apt upgrade
sudo apt install -y \
    jq \
    fzf \
    git \
    guix \
    curl \
    tree \
    tidy \
    shfmt \
    neovim \
    clojure \
    ripgrep \
    fd-find \
    chromium \
    markdown \
    guile-3.0 \
    shellcheck \
    texlive-full \
    libxml2-utils \
    openjdk-21-jdk

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/weavejester/cljfmt/HEAD/install.sh)"
