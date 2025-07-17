#!/bin/bash

if command -v fzf &>/dev/null; then
  echo "fzf is already installed."
  exit 0
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-update-rc --no-completion --no-key-bindings
