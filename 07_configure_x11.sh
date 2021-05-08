#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"


print_message "#### Installing X server ####"

check_user

mkdir -p $HOME/.config/X11

ln -sf $ROOT_DIR/dotfiles/X11/.xinitrc $HOME/.config/X11/.xinitrc
ln -sf $ROOT_DIR/dotfiles/X11/.xserverrc $HOME/.config/X11/.xserverrc
