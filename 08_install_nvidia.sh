#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Installing NVIDIA graphics driver <<<"

check_root

###############################################################################

print_subheader ">>> Installing a driver and utils... <<<"

if pacman -Qi linux-lts > /dev/null 2>&1
then
    install_official_packages linux-lts-headers nvidia-lts
    HOOK=nvidia-lts
else
    install_official_packages linux-headers nvidia
    HOOK=nvidia
fi

install_official_packages nvidia-settings libvdpau-va-gl nvtop

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Installing pacman hook... <<<"

mkdir -p /etc/pacman.d/hooks/
install -Dm 644 -t /etc/pacman.d/hooks/ "$WIZARD_DOT/nvidia/${HOOK}.hook"

print_subheader ">>> Done! <<<"
