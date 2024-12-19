#!/usr/bin/env bash

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

# -------------
# Dockfmt
# -------------

# Export the sha256sum for verification.
export DOCKFMT_SHA256="f6bc025739cf4f56287e879c75c11cc73ebafdf93a57c9bcd8805d1ab82434a0"

# Download and check the sha256sum.
sudo curl -fSL "https://github.com/jessfraz/dockfmt/releases/download/v0.3.3/dockfmt-linux-amd64" -o "/usr/local/bin/dockfmt" &&
    echo "${DOCKFMT_SHA256}  /usr/local/bin/dockfmt" | sha256sum -c - &&
    sudo chmod a+x "/usr/local/bin/dockfmt"

echo "dockfmt installed!"

# Run it!
dockfmt -h
