#!/bin/sh

[ -f $HOME/.xprofile ] && . $HOME/.xprofile

xrandr --auto

# set keymap
xset r rate 500 20
setxkbmap -layout "us,ru" -option "grp:win_space_toggle"

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
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

xbindkeys

while true
do
	VOL="VOL:$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"
	LOCALTIME="TIME:$(date +%Z\=%Y-%m-%dT%H:%M)"
	IP="IP:$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1)" # can get confused if you use vmware
	TEMP="TEMP:$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
	BAT="BAT:$(acpi -b | grep -o '[[:digit:]]*%' | tr '\n' '|')"
	xsetroot -name "$IP/$BAT/$VOL/$TEMP/$LOCALTIME"

	sleep 10s
done &
exec dwm

