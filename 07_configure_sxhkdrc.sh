#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring sxhkd <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $HOME/.config/sxhkd
ln -sf $WIZARD_DOT/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc

print_subheader ">>> Done! <<<"
