#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Installing AUR helper ####"

check_user

print_message "Installing yay..."
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd $ROOT_DIR
