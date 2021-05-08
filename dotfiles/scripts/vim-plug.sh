#!/bin/sh

PLUG_VIM="$HOME/.local/share/nvim/site/autoload/plug.vim"
curl -fLo "$PLUG_VIM" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim