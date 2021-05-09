#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Installing X server ####"

check_user

install_official_packages xorg xorg-xinit

install_official_packages xf86-video-fbdev 

install_official_packages xf86-video-amdgpu

install_official_packages xf86-video-intel

install_official_packages xf86-video-vesa

install_official_packages sxhkd

install_official_packages maim

install_official_packages xclip xsel

install_official_packages pavucontrol

install_official_packages blueman

install_official_packages sxiv

install_official_packages zathura zathura-pdf-mupdf zathura-djvu zathura-ps

install_official_packages ffmpeg ffmpegthumbnailer

install_official_packages firefox firefox-extension-https-everywhere

install_official_packages firefox-ublock-origin firefox-decentraleyes

install_official_packages telegram-desktop

install_official_packages simple-scan

install_official_packages inkscape

install_official_packages code
