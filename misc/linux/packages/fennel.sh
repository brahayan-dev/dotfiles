#!/usr/bin/env sh

# -----------
# Lua
# -----------
cd /tmp/
curl -L -R -O https://www.lua.org/ftp/lua-5.4.7.tar.gz
tar zxf lua-5.4.7.tar.gz
cd lua-5.4.7
make all test
mkdir -p ~/.local/bin
mkdir -p ~/.local/include/lua54
mv src/* ~/.local/include/lua54
mv ~/.local/include/lua54/lua ~/.local/bin

# -----------
# Luarocks
# -----------
cd /tmp/
wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
tar zxpf luarocks-3.11.1.tar.gz
cd luarocks-3.11.1
./configure && make && sudo make install

# -----------
# Luarocks
# -----------
sudo luarocks install fennel
