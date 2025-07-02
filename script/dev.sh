#!/usr/bin/env bash

# Source logging functions
source "$(dirname "${BASH_SOURCE[0]}")/logging.sh"

# Constants
readonly ICON="$HOME/.local/share/icons/doom.png"
readonly DESKTOP_FILE=/usr/share/applications/emacs.desktop

# Download Doom Emacs
download_doom() {
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
}

# Install Doom Emacs
install_doom() {
    cd ~/.config/emacs/bin || return
    sh doom install --no-config --install --fonts --color --force --env
}

# Change Emacs icon to Doom icon
change_icon() {
    mkdir -p "$HOME/.local/share/icons"
    wget https://raw.githubusercontent.com/eccentric-j/doom-icon/master/cute-doom/doom.png -O "$ICON" &&
        sudo --preserve-env=ICON,DESKTOP_FILE sed -i "s|Icon=.*|Icon=$ICON|" $DESKTOP_FILE
}

# Execute doom command
execute_doom() {
    log_info "Downloading Doom Emacs"
    download_doom

    log_info "Installing Doom Emacs"
    install_doom
}

# Execute icon command
execute_icon() {
    log_info "Changing Emacs icon to Doom icon"
    change_icon
} 