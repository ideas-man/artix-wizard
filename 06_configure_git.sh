#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Configuring SSH ####"

check_user

mkdir -p $HOME/.config/git
ln -sf $ROOT_DIR/dotfiles/git/config $HOME/.config/git/config
ln -sf $ROOT_DIR/dotfiles/git/ignore $HOME/.config/git/ignore
