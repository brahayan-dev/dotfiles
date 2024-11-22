#!/usr/bin/env bash

# INSTALL PACKAGES
# -----------------
sudo apt upgrade
sudo apt install -y \
    git \
    zsh \
    guix \
    curl \
    neovim \
    clojure \
    guile-3.0 \
    openjdk-21-jdk

# Install babashka
curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x install
bash ./install
rm install

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
nvm install 22

# Define default shell
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Build emacs
bash ./build-emacs.sh
