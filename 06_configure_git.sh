#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring git <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $HOME/.config/git
ln -sf $WIZARD_DOT/git/config $HOME/.config/git/config
ln -sf $WIZARD_DOT/git/ignore $HOME/.config/git/ignore

print_subheader ">>> Done! <<<"
