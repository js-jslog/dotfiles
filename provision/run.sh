#! /bin/bash

# prerequisite for adding repos
sudo apt-get install software-properties-common

# install vim8
sudo apt-get update
sudo -E add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

# install ctags
sudo apt-get install ctags
