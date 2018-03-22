#!/bin/bash
sudo rm -r ~/.vim || true
mkidr -p ~/.ssh
cp --remove-destination ./.ssh/config ~/.ssh/config
cp -n ~/.bashrc ~/.bashrc.original
cp --remove-destination ./.bashrc ~/.bashrc
cp --remove-destination ./.bash_aliases ~/.bash_aliases
cp --remove-destination ./profile.d/bashfunctions.sh /etc/profile.d/bashfunctions.sh
cp --remove-destination .tmux.conf ~/.
cp --remove-destination .vimrc ~/.
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
