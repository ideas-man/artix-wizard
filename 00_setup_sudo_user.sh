#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")"
. "$ROOT_DIR/.wizard_utils.sh"

print_message "#### Creating a maintainer user ####"

check_root

until { echo -n 'User name: '; read -r USERNAME; useradd -m "$USERNAME"; }
do echo "Try again"; sleep 2; done
until passwd $USERNAME; do echo "Try again"; sleep 2; done

install -Dm 0440 "$ROOT_DIR/dotfiles/misc/user_sudoers" /etc/sudoers.d/${USERNAME}_sudoers
sed -i "s/\$USERNAME/$USERNAME/g" /etc/sudoers.d/${USERNAME}_sudoers
