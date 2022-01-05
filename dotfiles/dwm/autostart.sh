# bin/sh

IFS='
'
for line in $(cbatticon -p | grep "id: BAT")
do
    
    BATTERY=$(echo "$line" | sed -E "s/.*(BAT[[:digit:]]*).*/\1/")
    cbatticon $BATTERY &
    sleep 0.2
done

blueman-applet &
sleep 0.2
pasystray &
sleep 0.2
gxkb &
