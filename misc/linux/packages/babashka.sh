#!/usr/bin/env bash

curl -o babashka -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x babashka
sudo bash ./babashka
rm babashka
