#!/usr/bin/env bash

set -eux

# directory where script and dotfiles are located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# create symlinks
ln -sf "$DOTFILES_DIR/.bash_aliases_mac" ~/.bash_aliases
ln -sf "$DOTFILES_DIR/.bash_profile" ~/.bash_profile
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/Brewfile" ~/.Brewfile
