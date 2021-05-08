# author: ivanp7 (https://github.com/ivanp7/archlinux-autoconfig)

check_root ()
{
    if [ "$(id -u)" != "0" ]; then
        echo This script must be run under root. Terminating...
        exit 1
    fi

    cd /
}

check_user ()
{
    if [ "$(id -u)" = "0" ]; then
        echo This script must be run under a non-priviledged user. Terminating...
        exit 1
    fi
}

install_official_packages ()
{
    sudo pacman --needed --noconfirm -S "$@"
}

install_packages ()
{
    yay --needed --noconfirm -S "$@"
}

uninstall_packages ()
{
    sudo pacman --noconfirm -Rns "$@"
}

add_cronjob ()
{
    crontab -l | { cat; echo "$@"; } | crontab -
}

print_message ()
{
    echo
    echo $(printf '%0.s-' $(seq 1 $(echo $* | wc -c)))
    echo $*
    echo $(printf '%0.s-' $(seq 1 $(echo $* | wc -c)))
    echo
}