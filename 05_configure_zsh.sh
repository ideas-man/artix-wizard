#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring zsh <<<"

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $HOME/.config/zsh
ln -sf $WIZARD_DOT/zsh/.zshenv $HOME/
ln -sf $WIZARD_DOT/zsh/.zshrc $HOME/.config/zsh/.zshrc
ln -sf $WIZARD_DOT/zsh/.zprofile $HOME/.config/zsh/.zprofile
ln -sf $WIZARD_DOT/zsh/.zlogin $HOME/.config/zsh/.zlogin
ln -sf $WIZARD_DOT/zsh/.zlogout $HOME/.config/zsh/.zlogout
ln -sf $WIZARD_DOT/zsh/.prompt $HOME/.config/zsh/.prompt
ln -sf $WIZARD_DOT/zsh/.functions $HOME/.config/zsh/.functions
ln -sf $WIZARD_DOT/zsh/.aliases $HOME/.config/zsh/.aliases

print_subheader ">>> Done! <<<"
