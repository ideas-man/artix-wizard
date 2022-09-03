#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring git <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $XDG_CONFIG_HOME/git
ln -sf $WIZARD_DOT/git/config $XDG_CONFIG_HOME/git/config
ln -sf $WIZARD_DOT/git/ignore $XDG_CONFIG_HOME/git/ignore

print_subheader ">>> Done! <<<"
