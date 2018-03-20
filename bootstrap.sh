#!/usr/bin/env bash

git pull origin master

git submodule init
git submodule update

function linking() {
    [[ -a ~/.$1 ]] && rm -rf ~/.$1
    ln -s $(pwd)/$1 ~/.$1
}

for file in {bashrc,vimrc,vim,tmux.conf,tmux}; do
    linking $file;
done;
unset file;

unset linking 
