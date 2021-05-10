#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Setting up cron jobs <<<"

check_root

###############################################################################

print_subheader ">>> Daily mandb update... <<<"

add_cronjob '@daily /usr/bin/mandb'
mandb

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Daily pkgfile update... <<<"

add_cronjob '@daily /usr/bin/pkgfile --update'
pkgfile --update

print_subheader ">>> Done! <<<"
