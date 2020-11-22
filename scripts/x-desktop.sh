#!/bin/sh

cd $HOME
startx "$XDOTDIR/.xinitrc" -- "$XDOTDIR/.xserverrc"
