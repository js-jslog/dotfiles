#!/bin/sh
rm ~/.tmux.conf || true
rm ~/.vimrc || true
sudo rm -r ~/.vim || true
sudo rm -r ~/.config/nvim || true
#mkdir -p ~/.vim/bundle
mkdir -p ~/.config/nvim/bundle
cp .tmux.conf ~/.
#cp .vimrc ~/.
cp init.vim ~/.config/nvim/init.vim
#git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
nvim +PluginInstall +qall
