#!/bin/bash

if command -v nvim &>/dev/null; then
  echo "Neovim is already installed."
  exit 0
fi

# Taken from https://github.com/neovim/neovim/blob/master/BUILD.md

# Prerequisites
sudo apt-get install ninja-build gettext cmake curl build-essential -y

cd /tmp

git clone https://github.com/neovim/neovim

cd neovim

git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install

cd .. && rm -rf neovim
