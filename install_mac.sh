#!/bin/bash

set -e

# directory where script and dotfiles are located
DOTFILES_DIR=$(dirname "$(readlink -f "$0")")

# create symlinks
ln -sf "$DOTFILES_DIR/.bash_aliases_mac" ~/.bash_aliases
ln -sf "$DOTFILES_DIR/.bash_profile" ~/.bash_profile
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
