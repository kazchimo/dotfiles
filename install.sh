#!/bin/bash
install/vim.sh
install/link_dotriles.sh
install/git.sh
install/vundle.sh

# install tig
if !(type tig > /dev/null 2>&1); then
  echo_progress "installing tig..."
  if [ ! -d $HOME/tig ]; then
    git clone git://github.com/jonas/tig.git
  fi
  cd $HOME/tig
  make prefix=/usr/local
  sudo make install prefix=/usr/local
fi

# install zsh
if !(type zsh > /dev/null 2>&1); then
  echo_progress "installing zsh..."
  sudo apt-get -y install zsh
fi

# install zplugin
if !(type zplugin > /dev/null 2>&1); then
  if [ ! -d $HOME/.zplugin/bin ]; then
    echo_progress "installing zplugin..."
    mkdir -p $HOME/.zplugin
    git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
  fi
fi

zsh
