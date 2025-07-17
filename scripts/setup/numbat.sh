#!/bin/bash

# Check if numbat is already installed
if command -v numbat &>/dev/null; then
  echo "numbat is already installed. Skipping installation."
  exit 0
fi

sudo apt install software-properties-common -y
# Add numbat PPA
sudo add-apt-repository ppa:apandada1/numbat -y
sudo apt update
sudo apt install numbat -y
