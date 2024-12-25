#!/usr/bin/env sh

# -------------
# Clojure
# -------------

cd /tmp/
curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
chmod +x linux-install.sh
sudo ./linux-install.sh

# -------------
# Babashka
# -------------

curl -o babashka -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x babashka
sudo bash ./babashka
rm babashka

# -------------
# Cljfmt
# -------------

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/weavejester/cljfmt/HEAD/install.sh)"
