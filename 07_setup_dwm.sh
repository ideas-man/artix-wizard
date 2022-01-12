#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring dwm <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $XDG_DATA_HOME/dwm
ln -sf $WIZARD_DOT/dwm/autostart.sh $XDG_DATA_HOME/dwm/autostart.sh:

print_subheader ">>> Done! <<<"
