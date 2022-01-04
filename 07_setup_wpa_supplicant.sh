#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring wpa supplicant <<<"

check_root

###############################################################################

print_subheader ">>> Creating symlinks... <<<"

ln -sf $WIZARD_DOT/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf

DBUS_FILE="/usr/share/dbus-1/system-services/fi.w1.wpa_supplicant1.service"
grep -q '^Exec=.*\s-f\s' "$DBUS_FILE" ||
    sed -i '/^Exec=/ s@$@ -f /var/log/wpa_supplicant.log@' "$DBUS_FILE"