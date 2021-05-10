#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Fix system suspend with NVIDIA driver <<<"

check_root

###############################################################################

print_subheader ">>> Installing a script and pacman hook... <<<"

install -Dm 644 -t /usr/lib/elogind/system-sleep/ "$WIZARD_DOT/nvidia/nvidia_copy" 
install -Dm 755 "$WIZARD_DOT/nvidia/nvidia_copy" /usr/lib/elogind/system-sleep/nvidia
install -Dm 644 -t /etc/pacman.d/hooks/ "$WIZARD_DOT/nvidia/nvidia-utils.hook"

print_subheader ">>> Done! <<<"
