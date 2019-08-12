alias v="vim"
if type "mvim" > /dev/null 2>&1; then
  alias vim='mvim -v'
else
  alias vim="vim.gnome-py2"
fi
alias vbr="vim $HOME/.bash_rc"
alias vv="vim $HOME/.vimrc"
