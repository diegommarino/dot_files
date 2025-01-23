#!/bin/bash

# Install nerd fonts to use with vim-neo-tree
sudo apt-get install unzip
wget -P ~/.local/share/fonts wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
# If you're still facing problems with it or is using Ubuntu through Windows WSL, try to install the font on Windows, 
# close Terminal and open again. Go to settings -> Profile -> Ubuntu version -> Appearance -> Font Family

# Install to use vim telescope live_grep
sudo apt install ripgrep
