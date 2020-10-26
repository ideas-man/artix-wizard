# XDG

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# General

export EDITOR=/usr/bin/nvim
export VISUAL=$EDITOR
#export TERMINAL=/usr/bin/st
export VIEWER=/usr/bin/sxiv
export PLAYER=/usr/bin/mpv
export PDFVIEWER=/usr/bin/zathura

# ZSH

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$ZDOTDIR/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000

# X11

export XDOTDIR=$XDG_CONFIG_HOME/X11
export XINITRC=$XDOTDIR/.xinitrc
export XSERVERRC=$XDOTDIR/.xserverrc

# Misc

export PASSWORD_STORE_DIR=$XDG_DATA_HOME/.password-store
export GNUPGHOME=$XDG_DATA_HOME/.gnupg