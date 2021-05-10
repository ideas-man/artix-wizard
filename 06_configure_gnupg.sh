#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring GNUPG <<<"

check_user

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $HOME/.local/share/gnupg
ln -sf $WIZARD_DOT/gnupg/gpg-agent.conf $HOME/.local/share/gnupg/gpg-agent.conf
ln -sf $WIZARD_DOT/gnupg/gpg.conf $HOME/.local/share/gnupg/gpg.conf

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Setting permissions... <<<"

chmod 700 $HOME/.local/share/gnupg/
chmod 600 $HOME/.local/share/gnupg/gpg.conf
chmod 600 $HOME/.local/share/gnupg/gpg-agent.conf

print_subheader ">>> Done! <<<"
