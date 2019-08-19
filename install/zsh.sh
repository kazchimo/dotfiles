source $HOME/dotfiles/funcs/installing.sh

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
