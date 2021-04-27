alias la="ls --color -a"
alias l="ls --color"
alias v="vim"
alias pspy="ps ax | grep py"
alias tf="tail -f"
alias vm="bindkey -v && bindkey 'jj' vi-cmd-mode"
alias ctlst="systemctl status"
alias vwpaspl="sudo vim /etc/wpa_supplicant/wpa_supplicant.conf"
alias ifconfig="ip addr show"
alias sd="sudo"
alias sdrb="sudo reboot"
alias tl="tail -n"
alias pkf="pkill -f"
alias pkfn="pkill -f ngrok"
alias pkfro="pkill -f RasOperation/main"
alias dropup="/home/pi/RasOperation/sh/operator_use_bash/dropbox_uploader.sh upload"
alias mac="cat "$(find /sys/devices/ -name wlan0)"/address" # display mac address
alias szr="source ~/.zshrc"
alias gsini="git submodule update --init --recursive"
alias killpy="kill $(pspy)"
alias jctl="journalctl -f -u"
alias fixzh="rm ~/.zsh_history" # fix corrupt zsh history file
alias setting="cat ~/genkan_setting.json"
alias psa="ps aux"
alias upd="(cd ~/raspi-bash; git pull; source ~/.zshrc)"
alias updr="(cd ~/RasOperation; git pull)"

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"

source ~/.bash_profile
source ~/.zplug/init.zsh

# docker alias
zplug "akarzim/zsh-docker-aliases"

zplug "zsh-users/zsh-syntax-highlighting"
# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "plugins/git",   from:oh-my-zsh
zplug "peterhurford/git-aliases.zsh"

# 本体（連携前提のパーツ）
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

# fzf でよく使う関数の詰め合わせ
zplug "mollifier/anyframe"

# ディレクトリ移動を高速化（fzf であいまい検索）
zplug "b4b4r07/enhancd", use:init.sh

# 利用可能なaliasを知らせてくれる
zplug "djui/alias-tips"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load
