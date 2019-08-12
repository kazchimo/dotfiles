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
  sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common

  sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev

  sudo rm -rf /usr/local/share/vim

  sudo rm /usr/bin/vim

  sudo mkdir /usr/include/lua5.1/include
  sudo cp /usr/include/lua5.1/*.h /usr/include/lua5.1/include/

  (cd /opt/ &&
    echo "###############" &&
    echo "##cloning vim##" &&
    echo "###############" &&
    sudo git clone https://github.com/vim/vim &&
    sudo git pull && sudo git fetch &&
    cd vim/src &&
    make distclean && # if vim was prev installed
    ./configure --with-features=huge \
    --enable-rubyinterp \
    --enable-largefile \
    --disable-netbeans \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib/python2.7/config \
    --enable-perlinterp \
    --enable-luainterp \
    --with-luajit \
    --enable-fail-if-missing \
    --with-lua-prefix=/usr/include/lua5.1 \
    --enable-cscope &&
    make &&
    sudo make install)

    fi
