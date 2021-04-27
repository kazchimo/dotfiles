PROJECT=$HOME/dotfiles

function install_zplug() {
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

which zplug > /dev/null 2>&1 || install_zplug

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# create links for links dir files
echo "linking dotfiles..."

for f in "$PROJECT"/dotfiles/.??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue

  echo "$(basename "$f") linked"
  ln -s -f "$f" $HOME/$(basename "$f")
done

