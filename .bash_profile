[[ -d ~/.pyenv ]] &&
  export PYENV_ROOT="${HOME}/.pyenv" &&
  export PATH="${PYENV_ROOT}/bin:$PATH" &&
  export PIPENV_VENV_IN_PROJECT=true &&
  eval "$(pyenv init -)"

if type "コマンド" > /dev/null 2>&1; then
  export CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include"
  export LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib"
fi

export PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs2"
export GOPATH=$HOME/development/Go
export PATH=$GOPATH/bin:$PATH:/usr/local/bin
source ~/.bash_rc

[[ -d ~/.rbenv ]] &&
  export PATH=${HOME}/.rbenv/bin:${PATH} &&
  eval "$(rbenv init -)"

export CURL_CA_BUNDLE="${HOME}/development/pem/cacert.pem"

mkdir -p $HOME/.vim/colors
cp -f $HOME/.vim/bundle/gruvbox-material/colors/gruvbox-material-hard.vim $HOME/.vim/colors

