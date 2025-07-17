#!/bin/bash

SCRIPTDIR=$(dirname "$0")

# TODO: use ./your_install_script.sh 2>&1 | tee install.log

echo -e "### installing lazygit"
"$SCRIPTDIR"/lazygit.sh || echo -e "lazygit installation failed"

echo -e "### installing lazyvim"
"$SCRIPTDIR"/neovim.sh || echo -e "neovim installation failed"

echo -e "### installing rust"
"$SCRIPTDIR"/rust.sh || echo -e "rust installation failed"

echo -e "### installing fzf"
"$SCRIPTDIR"/fzf.sh || echo -e "fzf installation failed"

echo -e "### installing numbat"
"$SCRIPTDIR"/numbat.sh || echo -e "numbat installation failed"

echo -e "### installing dotfiles"
"$SCRIPTDIR"/dotfiles.sh || echo -e "dotfiles installation failed"
