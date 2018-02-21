#!/bin/sh
rm ~/.tmux.conf || true
rm ~/.vimrc || true
sudo rm -r ~/.vim || true
sudo rm -r ~/.config/nvim || true
mkdir -p ~/.vim/bundle
cp .tmux.conf ~/.
cp .vimrc ~/.
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
