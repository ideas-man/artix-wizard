#!/bin/sh

. "./.wizard_utils.sh"

print_header ">>> Installing core packages for server environment <<<"

check_user

###############################################################################

install_official_packages man-db man-pages
install_official_packages dash
install_official_packages zsh zsh-completions zsh-syntax-highlighting

install_official_packages sshfs encfs
install_official_packages wget rsync
install_official_packages dosfstools ntfs-3g inotify-tools entr
install_official_packages ncdu
install_official_packages unzip unrar p7zip atool

install_official_packages cpupower usbutils usb_modeswitch

install_official_packages pkgfile
install_official_packages base-devel ctags

install_official_packages inetutils gnu-netcat ngrep tcpdump nmap
install_official_packages lsof
install_official_packages gdb strace
install_official_packages wol ethtool

install_official_packages neovim
install_official_packages tmux
install_official_packages fzf

install_official_packages neofetch htop iftop iotop powertop iptraf-ng

install_official_packages at at-runit
install_official_packages cronie cronie-runit

install_official_packages rng-tools rng-tools-runit
install_official_packages tlp tlp-runit 
install_official_packages acpi acpid-runit
install_official_packages openssh openssh-runit 
install_official_packages ntp ntp-runit
install_official_packages dhcpcd dhcpcd-runit
install_official_packages nfs-utils nfs-utils-runit
install_official_packages rpcbind rpcbind-runit

install_packages nvimpager-git archivemount

print_subheader ">>> Done! <<<"
