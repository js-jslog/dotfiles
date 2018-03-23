#! /bin/bash
function buildvim {
  sudo rm -r ~/.vim || true
  git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}
