source ../funcs/installing.sh

if !(type "tig" > /dev/null 2>&1); then
  echo_progress "installing tig..."
  if [ ! -d $HOME/tig ]; then
    git clone git://github.com/jonas/tig.git
  fi
  cd $HOME/tig
  make prefix=/usr/local
  sudo make install prefix=/usr/local
fi
