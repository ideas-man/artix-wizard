# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# General
export EDITOR=/usr/bin/nvim
export VISUAL=$EDITOR
export TERMINAL=/usr/bin/st
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

# ncurses
export TERMINFO=$XDG_DATA_HOME/terminfo
export TERMINFO_DIRS=$XDG_DATA_HOME/terminfo:/usr/share/terminfo

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java

# ipython/jupyter
export IPYTHONDIR=$XDG_CONFIG_HOME/jupyter
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter

# gnupg/pass
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/.password-store
export GNUPGHOME=$XDG_DATA_HOME/gnupg

# vscode
export VSCODE_PORTABLE=$XDG_DATA_HOME/vscode

# less
export LESSHISTFILE=$XDG_CACHE_HOME/less/history