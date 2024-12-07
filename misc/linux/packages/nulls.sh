#!/usr/bin/env bash

sudo apt install leiningen hyperfine build-essential zlib1g-dev
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 23.0.1-graal
