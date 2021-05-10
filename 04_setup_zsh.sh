#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Setting zsh shell for the user and root <<<"

check_user

###############################################################################

print_subheader ">>> Installing pacman hook... <<<"

sudo mkdir -p /var/cache/zsh/
sudo mkdir -p /etc/pacman.d/hooks/
sudo install -Dm 644 -t /etc/pacman.d/hooks/ "$WIZARD_DOT/zsh/zsh.hook"

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Changing shell... <<<"

mkdir -p $HOME/.cache/zsh
chsh -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh

print_subheader ">>> Done! <<<"
