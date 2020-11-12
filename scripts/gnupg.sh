#!/bin/sh

#sed -i "s@USERHOME@$HOME@g" $HOME/.local/share/gnupg/gpg-agent.conf

chmod 700 $HOME/.local/share/.gnupg/
chmod 600 $HOME/.local/share/.gnupg/gpg.conf
chmod 600 $HOME/.local/share/.gnupg/gpg-agent.conf 
