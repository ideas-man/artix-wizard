#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Updating pacman GPG keys ####"

check_root

sed -i "s/^#Color/Color/" /etc/pacman.conf

pacman -Sy archlinux-keyring artix-keyring
pacman-key --init
pacman-key --populate archlinux artix
pacman --noconfirm -Scc
pacman --noconfirm -Syyu
