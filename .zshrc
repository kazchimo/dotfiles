#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source /Users/moriyamakazuki/.bash_profile

# 色を使用
autoload -Uz colors ; colors

autoload -U promptinit; promptinit
prompt pure

bindkey -v

# alias
alias szsh="source $HOME/.zshrc"
alias vzsh="vim $HOME/.zshrc"
alias -s py="python"
