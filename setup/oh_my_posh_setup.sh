#!/bin/bash
# Install oh-my-posh 
if ! command -v oh-my-posh 2>&1 >/dev/null
then
  curl -s https://ohmyposh.dev/install.sh | bash -s
else
  echo "oh-my-posh is already installed"
fi

# Link themes folder
echo "Linking themes folder"
if [ -d ~/.poshthemes ];
then 
  ln -s ./poshthemes/.custom_tonybaloney.omp.json ~/.poshthemes/
else 
  ln -s ./poshthemes ~/.poshthemes
fi

echo "Linking .sharedcfg/.shared_zshrc"
# Check if .shared_zshrc line exists in .zshrc
LINE="source ~/.sharedcfg/.shared_zshrc"
grep -qxF "$LINE" ~/.zshrc || echo $LINE >> ~/.zshrc

echo "Adding '$'HOME/.local/bin"
# Check if .shared_zshrc line exists in .zshrc
LINE="export PATH=$HOME/.local/bin:$PATH\n"
grep -qxF "$LINE" ~/.zshrc || sed -i "1s/^/$LINE/" ~/.zshrc

zsh
