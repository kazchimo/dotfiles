#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".style.yapf" ]] && continue

    echo $f
    ln -s $HOME/dotfiles/$f $HOME/$f
done
