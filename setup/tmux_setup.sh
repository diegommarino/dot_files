#!/bin/bash

source ./setup/helpers.sh
# Install tmux
check_and_install_program tmux "sudo apt-get install -y tmux"
check_and_install_program pipx "sudo apt-get install -y pipx"
zsh
check_and_install_program tmuxp "pipx install tmuxp"
add_shared_config_line "source-file ~/.sharedcfg/.tmux.conf" ~/.tmux.conf
mkdir -p ~/.tmuxp
zsh
