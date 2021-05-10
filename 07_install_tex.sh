#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Setting a TeX environment <<<"

check_user

###############################################################################

print_subheader ">>> Installing a TeX package group... <<<"

install_official_packages texlive-most

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Installing a CTAN package manager... <<<"

install_packages tllocalmgr-git

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Installing a TeX editor... <<<"

install_official_packages texstudio

print_subheader ">>> Done! <<<"
