#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Creating a maintainer user <<<"

check_root

###############################################################################

print_subheader ">>> Creating a user with a home directory in /home/... <<<"

until { echo -n 'User name: '; read -r USERNAME; useradd -m "$USERNAME"; }
do echo "Try again"; sleep 2; done

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Setting the password... <<<"

until passwd $USERNAME; do echo "Try again"; sleep 2; done

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader "Adding the user to sudoers..."

install -Dm 0440 "$WIZARD_DOT/misc/user_sudoers" /etc/sudoers.d/${USERNAME}_sudoers
sed -i "s/\$USERNAME/$USERNAME/g" /etc/sudoers.d/${USERNAME}_sudoers

print_subheader ">>> Done! <<<"
