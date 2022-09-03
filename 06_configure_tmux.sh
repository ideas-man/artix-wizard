#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring tmux <<<"

check_user

###############################################################################

print_subheader ">>> Downloading TPM... <<<"

git clone https://github.com/tmux-plugins/tpm $XDG_CACHE_HOME/tmux/plugins/tpm

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $XDG_CONFIG_HOME/tmux
ln -sf $WIZARD_DOT/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
ln -sf $WIZARD_DOT/tmux/tmux.style $XDG_CONFIG_HOME/tmux/tmux.style

print_subheader ">>> Done! <<<"
