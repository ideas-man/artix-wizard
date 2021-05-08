#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Configuring zsh ####"

mkdir -p $HOME/.config/zsh

ln -sf $ROOT_DIR/dotfiles/zsh/.zshenv $HOME/

ln -sf $ROOT_DIR/dotfiles/zsh/.zshrc $HOME/.config/zsh/.zshrc
ln -sf $ROOT_DIR/dotfiles/zsh/.zprofile $HOME/.config/zsh/.zprofile

ln -sf $ROOT_DIR/dotfiles/zsh/.zlogin $HOME/.config/zsh/.zlogin
ln -sf $ROOT_DIR/dotfiles/zsh/.zlogout $HOME/.config/zsh/.zlogout

ln -sf $ROOT_DIR/dotfiles/zsh/.prompt $HOME/.config/zsh/.prompt
ln -sf $ROOT_DIR/dotfiles/zsh/.functions $HOME/.config/zsh/.functions

ln -sf $ROOT_DIR/dotfiles/zsh/.aliases $HOME/.config/zsh/.aliases
