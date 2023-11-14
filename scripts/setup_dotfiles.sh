#!/bin/bash

# terminate script if any errors occur
set -e

# dotfiles directory
DOTFILES_DIR=~/dotfiles

# creating symlinks
ln -sf $DOTFILES_DIR/.bash_aliases ~/.bash_aliases
ln -sf $DOTFILES_DIR/.bashrc ~/.bashrc
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/.tmux.conf ~/.tmux.conf

echo "Dotfiles have been symlinked."