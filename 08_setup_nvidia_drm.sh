#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Enabling Nvidia Direct Rendering Manager <<<"

check_root

###############################################################################

print_subheader ">>> Installing a dkms and prime packages... <<<"

install_official_packages nvidia-dkms nvidia-prime

grep -q '^MODULES=[^#]*nvidia' /etc/mkinitcpio.conf || {
    MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm"
    sed -i "/^MODULES=/ s/(/($MODULES /" /etc/mkinitcpio.conf
    mkinitcpio -P
}

grep -q '^GRUB_CMDLINE_LINUX_DEFAULT=[^#]*nvidia' /etc/default/grub || {
    sed -i "/^GRUB_CMDLINE_LINUX_DEFAULT=/ s@\"@\"nvidia-drm.modeset=1 @" /etc/default/grub
    grub-mkconfig -o /boot/grub/grub.cfg
}

print_subheader ">>> Done! <<<"
