#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring SSH for desktop <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $HOME/.ssh
ln -sf $WIZARD_DOT/ssh/config $HOME/.ssh/config

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Setting permissions... <<<"

chmod 700 $HOME/.ssh/
chmod 600 $HOME/.ssh/config

print_subheader ">>> Done! <<<"
