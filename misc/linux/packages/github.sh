#!/usr/bin/env bash

# DNF5 installation commands
sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

ssh-keygen -t ed25519 -C "bxsr@proton.me"
git config --global user.email "bxsr@proton.me"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
gh auth login
gh auth refresh -h github.com -s admin:ssh_signing_key
gh ssh-key add ~/.ssh/id_ed25519.pub --type signing
