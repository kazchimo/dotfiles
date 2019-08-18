if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
  echo_progress "installing Vundle..."
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

