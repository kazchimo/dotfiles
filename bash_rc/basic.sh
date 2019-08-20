alias cop="open ."
alias sbr="source $HOME/.bash_profile"
alias pipi="pip install"
alias dc="docker-compose"
alias d="docker"
alias de="docker exec"
alias ...="cd ../../"
alias cdv="cd $HOME/development/"
alias bi="brew install"
alias jn="jupyter notebook"
alias arp="arp-scan -l --interface en0"
alias b="brew"
alias lg="lazygit"
alias la="ls -a"
alias greq="pip freeze > requirements.txt" # generate requirements.txt
alias l="ls"
alias ptp="ptpython --vi"

if [ "$(uname)" = 'Darwin' ]; then
  if ! type rmtrash &> /dev/null; then
    brew install rmtrash
  fi
  alias rm="rmtrash"
elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
  if ! type trash-put &> /dev/null; then
    sudo apt install git
    git clone https://github.com/andreafrancia/trash-cli $HOME/trash-cli
    (cd $HOME/trash-cli && sudo python setup.py install)
  fi
  alias rm="trash-put"
fi

# functions
function psgre() {
  ps aux | grep $1 | grep -v grep
}

function clipcp() {
  cat $1 | pbcopy
}

function cpcmd() { # copy cmd output
  eval $* | pbcopy
}

function edic() {
  w3m "http://ejje.weblio.jp/content/$1" | grep "主な"
}
