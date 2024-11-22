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
    ripgrep \
    fd-find \
    guile-3.0 \
    openjdk-21-jdk

# Install babashka
curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x install
sudo bash ./install
rm install

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 22

# Define default shell
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Build emacs
sudo bash ./build-emacs.sh

# Install doom
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
