#!/bin/bash

source ./setup/helpers.sh
# Install tmux
check_and_install_program tmux "sudo apt-get install -y tmux"
check_and_install_program pip3 "sudo apt-get install -y python3-pip"
zsh
check_and_install_program tmuxp "pip3 install --user tmuxp"
add_shared_config_line "source-file ~/.sharedcfg/.tmux.conf" ~/.tmux.conf
mkdir -p ~/.tmuxp
zsh
