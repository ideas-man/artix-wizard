#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Setting up pacman <<<"

check_root

###############################################################################

print_subheader ">>> Editing /etc/pacman.conf... <<<"

sed -i "s/^#Color/Color/" /etc/pacman.conf

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Adding GPG keys... <<<"

pacman -Sy archlinux-keyring artix-keyring
pacman-key --init
pacman-key --populate archlinux artix
pacman --noconfirm -Scc
pacman --noconfirm -Syyu

print_subheader ">>> Done! <<<"
