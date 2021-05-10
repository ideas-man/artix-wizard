#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Setting dash the default script interpreter <<<"

check_root

###############################################################################

print_subheader ">>> Creating a symlink to /usr/bin/sh... <<<"

ln -sfT dash /usr/bin/sh

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Installing a pacman hook... <<<"

mkdir -p /etc/pacman.d/hooks/
install -Dm 644 -t /etc/pacman.d/hooks/ "$WIZARD_DOT/dash/dash.hook"

print_subheader ">>> Done! <<<"
