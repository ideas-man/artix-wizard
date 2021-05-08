#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Configuring zsh ####"

check_user

sudo mkdir -p /var/cache/zsh/

sudo mkdir -p /etc/pacman.d/hooks/
sudo install -Dm 644 -t /etc/pacman.d/hooks/ "dotfiles/zsh/zsh.hook"

mkdir -p $HOME/.cache/zsh

chsh -s /usr/bin/zsh

sudo chsh -s /usr/bin/zsh
