#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Configuring SSH ####"

check_user

mkdir -p $HOME/.ssh
ln -sf $ROOT_DIR/dotfiles/ssh/config $HOME/.ssh/confg

chmod 700 $HOME/.ssh/
chmod 600 $HOME/.ssh/config
