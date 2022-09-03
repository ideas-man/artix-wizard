#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring nvim <<<"

check_user

###############################################################################

print_subheader ">>> Pulling vim-plug... <<<"

curl -fLo "$XDG_DATA_HOME/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $XDG_CONFIG_HOME/nvim
ln -sf $WIZARD_DOT/nvim/init.vim $XDG_CONFIG_HOME/nvim/init.vim

print_subheader ">>> Done! <<<"
