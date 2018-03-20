#!/bin/bash
mkdir -p ~/.vim/bundle
sudo rm -r ~/.vim || true
cp -n ~/.bashrc ~/.bashrc.original
cp -rf ./.bashrc ~/.bashrc
cp -rf ./.bash_aliases ~/.bash_aliases
cp -rf ./.bash_functions_rsl ~/.bash_functions_rsl
cp -rf .tmux.conf ~/.
cp -rf .vimrc ~/.
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
