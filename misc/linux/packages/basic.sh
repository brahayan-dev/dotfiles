#!/usr/bin/env bash

sudo dnf update
sudo dnf -y install \
    jq \
    git \
    lua \
    npm \
    nodejs \
    curl \
    fennel \
    emacs \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin \
    tree \
    stow \
    xclip \
    pdftk \
    rlwrap \
    clojure \
    direnv \
    ripgrep \
    openjdk-21-jdk 

sudo dnf copr enable birkch/dbeaver
sudo dnf install dbeaver-ce 
sudo dnf copr enable pgdev/ghostty
sudo dnf install ghostty

# Fonts
mkdir -p /tmp/adodefont
cd /tmp/adodefont
mkdir -p ~/.fonts
wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
unzip 1.050R-it.zip
cp source-code-pro-2.030R-ro-1.050R-it/OTF/*.otf ~/.fonts/
wget https://github.com/adobe-fonts/source-serif-pro/archive/2.000R.zip
unzip 2.000R.zip
cp source-serif-pro-2.000R/OTF/*.otf ~/.fonts/
wget https://github.com/adobe-fonts/source-sans-pro/archive/2.020R-ro/1.075R-it.zip
unzip 1.075R-it.zip
cp source-sans-pro-2.020R-ro-1.075R-it/OTF/*.otf ~/.fonts/
fc-cache -f -v

# Babashka
curl -o babashka -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x babashka
sudo bash ./babashka
rm babashka
# Cljfmt
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/weavejester/cljfmt/HEAD/install.sh)"
# Clojure Lsp
sudo bash < <(curl -s https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install)

# Define default shell
chsh -s "$(which zsh)"
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install doom
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

# Change emacs icon
mkdir -p "$HOME/.local/share/icons"
ICON="$HOME/.local/share/icons/doom.png"
DESKTOP_FILE=/usr/local/share/applications/emacs.desktop
wget https://raw.githubusercontent.com/eccentric-j/doom-icon/master/cute-doom/doom.png -O "$ICON" &&
    sudo --preserve-env=ICON,DESKTOP_FILE sed -i "s|Icon=.*|Icon=$ICON|" $DESKTOP_FILE

