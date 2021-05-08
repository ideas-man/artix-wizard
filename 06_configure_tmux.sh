#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Configuring SSH ####"

check_user

git clone https://github.com/tmux-plugins/tpm $HOME/.cache/tmux/plugins/tpm

mkdir -p $HOME/.config/tmux

ln -sf $ROOT_DIR/dotfiles/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
ln -sf $ROOT_DIR/dotfiles/tmux/tmux.style $HOME/.config/tmux/tmux.style
