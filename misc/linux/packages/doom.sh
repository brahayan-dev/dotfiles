#!/usr/bin/env bash

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

# Change icon
mkdir -p "$HOME/.local/share/icons"
ICON="$HOME/.local/share/icons/doom.png"
DESKTOP_FILE=/usr/local/share/applications/emacs.desktop
wget https://raw.githubusercontent.com/eccentric-j/doom-icon/master/cute-doom/doom.png -O "$ICON" &&
    sudo --preserve-env=ICON,DESKTOP_FILE sed -i "s|Icon=.*|Icon=$ICON|" $DESKTOP_FILE
