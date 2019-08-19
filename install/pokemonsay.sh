source $HOME/dotfiles/funcs/installing.sh

if !(type "pokemonsay" > /dev/null 2>&1); then
  if [ "$(uname)" == 'Darwin' ]; then
    # Mac
    :
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # Linux
    sudo apt-get install fortune cowsay
    git clone http://github.com/possatti/pokemonsay
    (cd pokemonsay && ./install.sh)
  elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    # Cygwin
    :
  else
    # other
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
  fi

fi
