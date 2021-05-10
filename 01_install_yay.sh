#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Installing AUR helper <<<"

check_user

###############################################################################

print_subheader ">>> Installing yay... <<<"

cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd $WIZARD_ROOT

print_subheader ">>> Done! <<<"
