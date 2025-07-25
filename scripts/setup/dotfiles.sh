#!/bin/bash

# Check if the dotfiles repository already exists
if [ -d "$HOME/.cfg" ]; then
  echo "Dotfiles already cloned."
  exit 0
fi

# Taken from https://www.atlassian.com/git/tutorials/dotfiles

git clone --bare https://github.com/Eeppii/dotfiles.git $HOME/.cfg
function config {
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config."
else
  echo "Backing up pre-existing dot files."
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi
config checkout
config config status.showUntrackedFiles no
