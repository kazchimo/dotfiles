#!/bin/bash

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == ".style.yapf" ]] && continue

  echo $f
  ln -s $HOME/dotfiles/$f $HOME/$f
done

# setup Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim with python interface
if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  sudo apt install vim-gnome-py2
fi
