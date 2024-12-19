#!/usr/bin/env bash

curl -o babashka -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x babashka
sudo bash ./babashka
rm babashka

curl -sfL https://direnv.net/install.sh | bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/weavejester/cljfmt/HEAD/install.sh)"
