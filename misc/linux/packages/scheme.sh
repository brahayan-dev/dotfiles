#!/usr/bin/env sh

cd /tmp/
git clone --filter=blob:none --depth 1 git@github.com:cisco/ChezScheme.git scheme
cd scheme
./configure
make
sudo make install
