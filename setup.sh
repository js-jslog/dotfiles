#!/bin/bash
rm ~/.tmux.conf || true
rm ~/.vimrc || true
rm ~/.bash_aliases || true
rm ~/.bash_functions_rsl || true
mkdir -p ~/.vim/bundle
sudo rm -r ~/.vim || true
cp -n ~/.bashrc ~/.bashrc.original
cp -rf ./.bashrc ~/.bashrc
cp ./.bash_aliases ~/.bash_aliases
cp ./.bash_functions_rsl ~/.bash_functions_rsl
cp .tmux.conf ~/.
cp .vimrc ~/.
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
