#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring X server <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $XDG_DATA_HOME/dwn
ln -sf $WIZARD_DOT/dwm/autostart.sh $XDG_DATA_HOME/autostart.sh:

print_subheader ">>> Done! <<<"
