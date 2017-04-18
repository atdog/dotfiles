#!/usr/bin/env bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/temp
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup

vim +PlugInstall +qall
