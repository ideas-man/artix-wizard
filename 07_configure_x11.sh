#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring X server <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $HOME/.config/X11
ln -sf $WIZARD_DOT/X11/.xinitrc $HOME/.config/X11/.xinitrc
ln -sf $WIZARD_DOT/X11/.xserverrc $HOME/.config/X11/.xserverrc

print_subheader ">>> Done! <<<"
