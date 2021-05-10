#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Configuring SSH for server <<<"

check_root

###############################################################################

print_subheader ">>> Creating groups... <<<"

groupadd ssh-users
groupadd sftp-users

print_subheader ">>> Done! <<<"

###############################################################################

print_subheader ">>> Configuring SSH server... <<<"

SSH_PORT=62222

sed -i "s/^#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin .*/PermitRootLogin no/" /etc/ssh/sshd_config
sed -i "s/^#PubkeyAuthentication .*/PubkeyAuthentication yes/" /etc/ssh/sshd_config
sed -i "s/^#PasswordAuthentication .*/PasswordAuthentication no/" /etc/ssh/sshd_config
sed -i "s/^#PermitEmptyPasswords .*/PermitEmptyPasswords no/" /etc/ssh/sshd_config
sed -i "s/^UsePAM .*/UsePAM no/" /etc/ssh/sshd_config
sed -i "s/^#X11Forwarding .*/X11Forwarding yes/" /etc/ssh/sshd_config
sed -i "s/^#X11UseLocalhost .*/X11UseLocalhost yes/" /etc/ssh/sshd_config
sed -i "/^Subsystem.*sftp.*/ s/Subsystem/#Subsystem/" /etc/ssh/sshd_config
cat "$WIZARD_DOT/ssh/sshd_config_tail" | tee -a /etc/ssh/sshd_config

print_subheader ">>> Done! <<<"
