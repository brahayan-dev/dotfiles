#!/usr/bin/env bash

sudo apt install python3-matplotlib leiningen hyperfine build-essential zlib1g-dev
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 23.0.1-graal
