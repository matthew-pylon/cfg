#!/bin/sh

mkdir -p ~/.terminfo
cp -R ~/.dotfiles/terminfo/* ~/.terminfo/

cp ~/.dotfiles/emacs.el ~/.emacs.el
