alias rm='rmtrash'
alias cop="open ."
alias sbr="source $HOME/.bash_profile"
alias pipi="pip install"
alias dc="docker-compose"
alias ...="cd ../../"
alias cdev="cd $HOME/development/"
alias bi="brew install"
alias jn="jupyter notebook"
alias arp="arp-scan -l --interface en0"


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
