#!/usr/bin/env bash

# Source logging functions
source "$(dirname "${BASH_SOURCE[0]}")/logging.sh"

# Connect dotfiles to GitHub
connect_github() {
    cd ~/.dotfiles || return
    git remote remove origin
    git remote add origin git@github.com:brahayan-dev/dotfiles.git
    git remote set-url origin git@github.com:brahayan-dev/dotfiles.git
}

# Set up SSH key for GitHub
set_ssh_key_to_github() {
    gh auth login
    gh auth refresh -h github.com -s admin:ssh_signing_key
    gh ssh-key add "$HOME/.ssh/${CURRENT_USER}_rsa.pub" --t "${CURRENT_USER}-ssh"
}

# Execute connect command
execute_connect() {
    log_info "Connecting dotfiles to GitHub over SSH"
    connect_github
}

# Execute github command
execute_github() {
    log_info "Setting up GitHub SSH key"
    set_ssh_key_to_github
} 
