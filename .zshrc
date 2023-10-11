alias la="ls --color -a"
alias l="ls --color"
alias v="vim"
alias tf="tail -f"
alias tl="tail -n"
alias szr="source ~/.zshrc"
alias lg="gitui"
alias vzr="vim ~/.zshrc"
alias bi="brew install"

autoload -Uz compinit
compinit

fpath+=~/.zfunc
export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
eval "$(pyenv init -)"
source "$HOME/.cargo/env"
printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'
