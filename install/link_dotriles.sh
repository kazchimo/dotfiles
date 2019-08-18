for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == ".style.yapf" ]] && continue

  echo "${f} linked"
  ln -s -f $HOME/dotfiles/$f $HOME/$f
done
