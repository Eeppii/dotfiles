#!/bin/bash

if command -v rustup &>/dev/null; then
  echo "Rustup is already installed."
else
  # From https://github.com/rust-lang/rustup/issues/297#issuecomment-444818896
  curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

# TODO only run this if not yet installed.
rustup default stable
# TODO: cargo might be in /opt/cargo/bin/cargo or /home/me/.cargo/bin/cargo. The former needs to run with sudo.
cargo install alacritty broot dua-cli exa ripgrep
# install br for broot
broot --install
