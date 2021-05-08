#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"


print_message "#### Installing X server ####"

check_user

mkdir -p $HOME/.config/sxhkd

ln -sf $ROOT_DIR/dotfiles/sxhkd/.xinitrc $HOME/.config/sxhkd/sxhkdrc
