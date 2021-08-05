#!/bin/sh

[ -f $XDOTDIR/.xprofile ] && . $XDOTDIR/.xprofile

xrandr --auto

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
	#VOL="VOL:$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"
	SINK=$(pactl list short sinks | grep RUNNING | sed 's/\s.*//')
	VOL="VOL:$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"
	LOCALTIME="TIME:$(date +%d.%m.%Y'/'%H:%M)"
	IP="IP:$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1)"
	#TEMP="TEMP:$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
	BAT="BAT:$(acpi -b | grep -o '[[:digit:]]*%' | tr '\n' '/' | head -c -1)"

	PWIFI=$(connmanctl technologies | grep -A 3 "/net/connman/technology/wifi" | tail -1 | sed 's/\s*Powered =\s*//')
	case $PWIFI in
		True) WIFIPWR="ON";;
		False) WIFIPWR="OFF";;
	esac
	CWIFI=$(connmanctl technologies | grep -A 4 "/net/connman/technology/wifi" | tail -1 | sed 's/\s*Connected =\s*//')
	case $CWIFI in
		True) WIFICON="V";;
		False) WIFICON="X";;
	esac
	WIFI="WIFI:$WIFIPWR/$WIFICON"

	PETH=$(connmanctl technologies | grep -A 3 "/net/connman/technology/ethernet" | tail -1 | sed 's/\s*Powered =\s*//')
	case $PETH in
		True) ETHPWR="ON";;
		False) ETHPWR="OFF";;
	esac
	CETH=$(connmanctl technologies | grep -A 4 "/net/connman/technology/ethernet" | tail -1 | sed 's/\s*Connected =\s*//')
	case $CETH in
		True) ETHCON="V";;
		False) ETHCON="X";;
	esac
	ETH="ETH:$ETHPWR/$ETHCON"

	PBT=$(connmanctl technologies | grep -A 3 "/net/connman/technology/bluetooth" | tail -1 | sed 's/\s*Powered =\s*//')
	case $PBT in
		True) BTPWR="ON";;
		False) BTPWR="OFF";;
	esac
	CBT=$(connmanctl technologies | grep -A 4 "/net/connman/technology/bluetooth" | tail -1 | sed 's/\s*Connected =\s*//')
	case $CBT in
		True) BTCON="V";;
		False) BTCON="X";;
	esac
	BT="BT:$BTPWR/$BTCON"

	SLANG=$(xset -q | grep LED | awk '{print $10}' | sed -E 's/....(.).../\1/')
	case $SLANG in
		0) LANG="LANG:EN";;
		1) LANG="LANG:RU";;
	esac

	xsetroot -name "$BAT|$IP|$WIFI|$ETH|$BT|$VOL|$LANG|$LOCALTIME"

	sleep 5s
done &
exec dwm
