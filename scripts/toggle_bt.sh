#!/bin/sh

if [ $(connmanctl technologies | grep -A 3 "/net/connman/technology/bluetooth" | tail -1 | sed 's/\s*Powered =\s*//') = "False" ]; then 
    connmanctl enable bluetooth
else
    connmanctl disable bluetooth
fi