#!/bin/bash

if [ -e ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc_old
fi
ln -sf ~/dotfiles/zshrc ~/.zshrc

if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc_old
fi
ln -sf ~/dotfiles/vimrc ~/.vimrc

