#!/bin/bash

sudo apt install libfuse2
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv ./nvim.appimage /usr/local/bin/nvim
nvim --version
echo "Instalation complete!"
