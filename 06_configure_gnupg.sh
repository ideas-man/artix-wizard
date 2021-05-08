#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Configuring SSH ####"

check_user

mkdir -p $HOME/.local/share/gnupg

ln -sf $ROOT_DIR/dotfiles/gnupg/gpg-agent.conf $HOME/.local/share/gnupg/gpg-agent.conf
ln -sf $ROOT_DIR/dotfiles/gnupg/gpg.conf $HOME/.local/share/gnupg/gpg.conf

chmod 700 $HOME/.local/share/gnupg/
chmod 600 $HOME/.local/share/gnupg/gpg.conf
chmod 600 $HOME/.local/share/gnupg/gpg-agent.conf
