# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source /Users/moriyamakazuki/.bash_profile

# 色を使用
autoload -Uz colors ; colors

bindkey -v

# alias
alias szr="source $HOME/.zshrc"
alias vzr="vim $HOME/.zshrc"
alias -s py="python"
alias -s sh="zsh"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

