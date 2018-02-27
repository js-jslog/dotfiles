#!/bin/bash
rm ~/.tmux.conf || true
rm ~/.vimrc || true
rm ~/.bash_aliases || true
mkdir -p ~/.vim/bundle
sudo rm -r ~/.vim || true
cp ./.bash_aliases ~/.bash_aliases
cp .tmux.conf ~/.
cp .vimrc ~/.
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
