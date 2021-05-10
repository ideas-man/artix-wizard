#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring tmux <<<"

check_user

###############################################################################

print_subheader ">>> Downloading TPM... <<<"

git clone https://github.com/tmux-plugins/tpm $HOME/.cache/tmux/plugins/tpm

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

mkdir -p $HOME/.config/tmux
ln -sf $WIZARD_DOT/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
ln -sf $WIZARD_DOT/tmux/tmux.style $HOME/.config/tmux/tmux.style

print_subheader ">>> Done! <<<"
