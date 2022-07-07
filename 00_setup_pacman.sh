#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Setting up pacman <<<"

check_root

###############################################################################

print_subheader ">>> Editing /etc/pacman.conf... <<<"

sed -i "s/^#Color/Color/" /etc/pacman.conf

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader">>> Enabling Arch repositories and adding gpg keys... <<<"

pacman -Sy artix-archlinux-support archlinux-keyring artix-keyring
cat "$WIZARD_DOT/pacman/pacman.conf" | tee -a /etc/pacman.conf

pacman-key --init
pacman-key --populate archlinux artix
pacman --noconfirm -Scc
pacman --noconfirm -Syyu

print_subheader ">>> Done! <<<"
