#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring sxhkd <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $XDG_CONFIG_HOME/sxhkd
ln -sf $WIZARD_DOT/sxhkd/sxhkdrc $XDG_CONFIG_HOME/sxhkd/sxhkdrc

mkdir -p $XDG_CONFIG_HOME/dunst
ln -sf $WIZARD_DOT/dunst/dunstrc $XDG_CONFIG_HOME/dunst/dunstrc

print_subheader ">>> Done! <<<"
