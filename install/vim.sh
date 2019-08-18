source ../funcs/installing.sh

# install vim with python interface
[ "$(expr substr $(uname -s) 1 5)" = 'Linux' ] &&
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
    echo_progress "executing make install Vim with Python interface..."
    sudo make install
    cd $HOME/dotfiles
      fi

