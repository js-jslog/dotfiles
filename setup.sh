#!/bin/bash
sudo rm -r ~/.vim || true
mkidr -p ~/.ssh
cp -rf ./.ssh/config ~/.ssh/config
cp -n ~/.bashrc ~/.bashrc.original
cp -rf ./.bashrc ~/.bashrc
cp -rf ./.bash_aliases ~/.bash_aliases
cp -rf ./.bash_functions_rsl ~/.bash_functions_rsl
cp -rf .tmux.conf ~/.
cp -rf .vimrc ~/.
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
