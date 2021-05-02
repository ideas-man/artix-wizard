#!/bin/sh

# color grid

local iter=0
while [ $iter -lt 16 ]
do
    echo -en "\033[38;5;$(echo $iter)m█ "
    printf "%03d" $iter

    if [ $(($iter % 8)) = 7 ]
    then printf '\r\n'; else printf ' '; fi

    local iter=$(($iter+1))
done

printf '\r\n'

local iter=16
while [ $iter -lt 52 ]
do
    local second=$(($iter+36))
    local third=$(($second+36))
    local four=$(($third+36))
    local five=$(($four+36))
    local six=$(($five+36))
    local seven=$(($six+36))

    echo -en "\033[38;5;$(echo $iter)m█ "
    printf "%03d" $iter
    echo -en "   \033[38;5;$(echo $second)m█ "
    printf "%03d" $second
    echo -en "   \033[38;5;$(echo $third)m█ "
    printf "%03d" $third
    echo -en "   \033[38;5;$(echo $four)m█ "
    printf "%03d" $four
    echo -en "   \033[38;5;$(echo $five)m█ "
    printf "%03d" $five
    echo -en "   \033[38;5;$(echo $six)m█ "
    printf "%03d" $six
    if [ $seven -lt 256 ]; then
        echo -en "   \033[38;5;$(echo $seven)m█ "
        printf "%03d" $seven
    fi

    local iter=$(($iter+1))
    printf '\r\n'
done
