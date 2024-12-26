#!/usr/bin/env bash

sudo apt install zsh

# Lsp
npm i -g bash-language-server

# Define default shell
chsh -s "$(which zsh)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

