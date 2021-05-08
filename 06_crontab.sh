#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

####################################################################

print_message "#### Configuring mandb ####"

####################################################################

check_root

####################################################################

add_cronjob '@daily /usr/bin/mandb'
mandb

add_cronjob '@daily /usr/bin/pkgfile --update'
pkgfile --update
