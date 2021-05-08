#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Installing NVIDIA graphics driver ####"

check_root

if pacman -Qi linux-lts > /dev/null 2>&1
then
    install_official_packages linux-lts-headers nvidia-lts
    HOOK=nvidia-lts
else
    install_official_packages linux-headers nvidia
    HOOK=nvidia
fi

install_official_packages nvidia-settings libvdpau-va-gl nvtop

mkdir -p /etc/pacman.d/hooks/
install -Dm 644 -t /etc/pacman.d/hooks/ "$ROOT_DIR/dotfiles/nvidia/${HOOK}.hook"
