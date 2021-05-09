#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Installing X server ####"

check_user

install_official_packages texlive-most

install_official_packages texstudio

install_packages tllocalmgr-git
