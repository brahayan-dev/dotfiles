#!/usr/bin/env bash

sudo apt install stow
git clone git@github.com:brahayan-dev/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
ls -al ~
