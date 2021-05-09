#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Fix computer suspend with Nvidia driver ####"

check_root

install -Dm 644 -t /usr/lib/elogind/system-sleep/ "$ROOT_DIR/dotfiles/nvidia/nvidia_copy" 

install -Dm 755 "$ROOT_DIR/dotfiles/nvidia/nvidia_copy" /usr/lib/elogind/system-sleep/nvidia

install -Dm 644 -t /etc/pacman.d/hooks/ "$ROOT_DIR/dotfiles/nvidia/nvidia-utils.hook"
