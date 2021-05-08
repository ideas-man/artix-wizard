#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Fix computer suspend with Nvidia driver ####"

check_root

install -Dm 644 -t /usr/lib/elogind/system-sleep/ "dotfiles/nvidia/nvidia_copy"
install -Dm 755 -t /usr/lib/elogind/system-sleep/nvidia "dotfiles/nvidia/nvidia_copy"

install -Dm 644 -t /etc/pacman.d/hooks/ "dotfiles/nvidia/nvidia-utils.hook"
