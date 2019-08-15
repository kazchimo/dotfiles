export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Customize to your needs...
source /Users/moriyamakazuki/.bash_profile

source $HOME/.zplugin/bin/zplugin.zsh

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

# ls color setting
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# set spaceship loading order
SPACESHIP_PROMPT_ORDER=(user host dir git node exec_time line_sep jobs exit_code char)

# Two regular plugins loaded without tracking.
zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting

# Plugin history-search-multi-word loaded with tracking.
zplugin load zdharma/history-search-multi-word

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# This is done by ice-mod `mv'{from} -> {to}'. There are multiple packages per
# single version, for OS X, Linux and Windows – so ice-mod `bpick' is used to
# select Linux package – in this case this is actually not needed, Zplugin will
# grep operating system name and architecture automatically when there's no `bpick'.
zplugin ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zplugin load docker/compose

# Scripts that are built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only, default target.
zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zplugin light tj/git-extras

# easyly cd gitroot
zplugin light "mollifier/cd-gitroot"

# enchance cd
zplugin light "b4b4r07/enhancd"

zplugin load "djui/alias-tips"

zplugin light zdharma/fast-syntax-highlighting

