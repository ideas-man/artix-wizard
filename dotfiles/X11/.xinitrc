#!/bin/sh

[ -f $XDOTDIR/.xprofile ] && . $XDOTDIR/.xprofile

[ -x "$XDG_CONFIG_HOME/screenlayout/layout.sh" ] && "$XDG_CONFIG_HOME/screenlayout/layout.sh" || xrandr --auto

# set keymap
xset r rate 500 20
setxkbmap -layout "us,ru" -option "grp:win_space_toggle"

userresources=$XDOTDIR/.xresources
usermodmap=$XDOTDIR/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# load config scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

sxhkd &

while true
do
	VOL="VOL:$(pamixer --get-volume)"
	LOCALTIME="TIME:$(date +%d.%m.%Y'/'%H:%M)"
	IP="IP:$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1)"

	xsetroot -name "$IP | $VOL | $LOCALTIME"

	sleep 1s
done &
exec dwm
