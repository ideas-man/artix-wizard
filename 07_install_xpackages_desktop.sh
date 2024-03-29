#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Installing core packages for workstation graphical environment <<<"

check_user

###############################################################################

install_official_packages xorg xorg-xinit

print_subheader ">>> Remember to choose GPU drivers to install!"

install_official_packages mesa vulkan-radeon xf86-video-amdgpu

install_official_packages sxhkd

install_official_packages maim

install_official_packages xclip xsel

install_official_packages pavucontrol

install_official_packages blueman

install_official_packages sxiv

install_official_packages zathura zathura-pdf-mupdf zathura-djvu zathura-ps

install_official_packages ffmpeg ffmpegthumbnailer

install_official_packages firefox

install_official_packages telegram-desktop

install_official_packages simple-scan

install_official_packages inkscape

install_official_packages code

install_official_packages arandr

install_official_packages solaar

print_subheader ">>> Done! <<<"
