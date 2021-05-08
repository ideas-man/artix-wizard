#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Making dash the default script interpreter ####"

check_root

ln -sfT dash /usr/bin/sh

mkdir -p /etc/pacman.d/hooks/
install -Dm 644 -t /etc/pacman.d/hooks/ "dotfiles/dash/dash.hook"
