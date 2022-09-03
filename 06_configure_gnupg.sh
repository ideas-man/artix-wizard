#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring GNUPG <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $XDG_DATA_HOME/gnupg
ln -sf $WIZARD_DOT/gnupg/gpg-agent.conf $XDG_DATA_HOME/gnupg/gpg-agent.conf
ln -sf $WIZARD_DOT/gnupg/gpg.conf $XDG_DATA_HOME/gnupg/gpg.conf

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Setting permissions... <<<"

chmod 700 $XDG_DATA_HOME/gnupg/
chmod 600 $XDG_DATA_HOME/gnupg/gpg.conf
chmod 600 $XDG_DATA_HOME/gnupg/gpg-agent.conf

print_subheader ">>> Done! <<<"
