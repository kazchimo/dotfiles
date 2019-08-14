export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Customize to your needs...
source /Users/moriyamakazuki/.bash_profile

# 色を使用
autoload -Uz colors
colors

# zsh vim key-vind setting
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# alias
alias szr="source $HOME/.zshrc"
alias vzr="vim $HOME/.zshrc"
alias -s py="python"
alias -s sh="zsh"

# Set Spaceship ZSH as a prompt
autoload -U promptinit
promptinit
prompt spaceship

# set spaceship loading order
SPACESHIP_PROMPT_ORDER=(user host dir git node exec_time line_sep jobs exit_code char)

