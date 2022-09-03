#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring X server <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $XDG_CONFIG_HOME/X11
ln -sf $WIZARD_DOT/X11/.xinitrc $XDG_CONFIG_HOME/X11/.xinitrc
ln -sf $WIZARD_DOT/X11/.xserverrc $XDG_CONFIG_HOME/X11/.xserverrc

print_subheader ">>> Done! <<<"
