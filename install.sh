#!/bin/bash

function echo_progress() {
  color_code="\e[33m"
  default_color_code="\e[m"
  window_size=`tput cols`
  window_separator="====${1}"
  rest_separator_len=$(($window_size-${#window_separator}))
  for i in `seq 1 ${rest_separator_len}`
  do
    window_separator+="="
  done

  echo -e $color_code$window_separator$default_color_code
}

# link dotfiles
echo_progress "linking dotfiles..."
for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == ".style.yapf" ]] && continue

  echo "${f} linked"
  ln -s -f $HOME/dotfiles/$f $HOME/$f
done

# setup Vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
  echo_progress "installing Vundle..."
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install vim with python interface
[ "$(expr substr $(uname -s) 1 5)" == 'Linux' ] &&
  if vim --version | grep -- "-python " > /dev/null; then
    echo_progress "removing Vim packages..."
    sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common

    echo_progress "installing Vim dependency packages..."
    sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev

    sudo rm -rf /usr/local/share/vim

    sudo rm /usr/bin/vim

    sudo mkdir /usr/include/lua5.1/include
    sudo cp /usr/include/lua5.1/*.h /usr/include/lua5.1/include/

    cd /opt/
    if [ ! -d vim ]; then
      echo_progress "cloling Vim github repo..."
      sudo git clone https://github.com/vim/vim
    fi
    # sudo git pull && sudo git fetch &&
    cd vim
    echo_progress "make distcleaning..."
    sudo make distclean  # if vim was prev installed

    echo_progress "configuring Vim make"
    sudo ./configure --with-features=huge \
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
      --enable-cscope

    echo_progress "executing make Vim with Python interface..."
    sudo make
    echo_progress "executing make installing Vim with Python interface..."
    echo_progress "executing make install Vim with Python interface..."
    sudo make install
    cd $HOME/dotfiles
      fi

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
