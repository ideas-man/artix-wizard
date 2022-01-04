#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring sxhkd <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $HOME/.config/sxhkd
ln -sf $WIZARD_DOT/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc

mkdir -p $HOME/.config/dunst
ln -sf $WIZARD_DOT/dunst/dunstrc $HOME/.config/dunst/dunstrc

print_subheader ">>> Done! <<<"
