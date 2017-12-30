#!/bin/sh
rm ~/.tmux.conf || true
rm ~/.vimrc || true
sudo rm -r ~/.vim || true
cp .tmux.conf ~/.
cp .vimrc ~/.
mkdir ~/.vim
mkdir ~/.vim/bundle
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
