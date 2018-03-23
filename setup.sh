#!/bin/bash

# if any original files exist then we will just move them rather than 
# delete them
# if the file is a symlink then it will have in all likelyhood been 
# provisioned by a version controlled dotfile manager so can just
# be overwritten by stage 2 below
if [[ ! -L ~/.bashrc ]]; then
  mv ~/.bashrc ~/.bashrc.original 2>/dev/null
fi
if [[ ! -L ~/.bash_aliases ]]; then
  mv ~/.bash_aliases ~/.bash_aliases.original 2>/dev/null
fi
if [[ ! -L ~/.vimrc ]]; then
  mv ~/.vimrc ~/.vimrc.original 2>/dev/null
fi
if [[ ! -L ~/.tmux.conf ]]; then
  mv ~/.tmux.conf ~/.tmux.conf.original 2>/dev/null
fi
if [[ ! -L ~/.gitconfig ]]; then
  mv ~/.gitconfig ~/.gitconfig.original 2>/dev/null
fi
if [[ ! -L ~/.ssh/config ]]; then
  mv ~/.ssh/config ~/.ssh/config.original 2>/dev/null
fi

# overwrite existing symbolic links if they exist
ln -sf ~/dotfiles-personal/.bashrc ~/.bashrc
ln -sf ~/dotfiles-personal/.bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles-personal/.vimrc ~/.vimrc
ln -sf ~/dotfiles-personal/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles-personal/.gitconfig ~/.gitconfig
mkdir -p ~/.ssh
ln -sf ~/dotfiles-personal/.ssh/config ~/.ssh/config

# overwriting sybolic links doesn't work if they are linked to directories apparently
# need to remove it
rm ~/bash.d || true
# now we can create the link
ln -s ~/dotfiles-personal/bash.d ~/bash.d

# filling the profile.d folder with scripts to be run at login shell initiation
# profile files should contain exported environment variables and functions for login shells
if [ -d ~/dotfiles-personal/profile.d/ ]; then
  for profilepath in $(find ~/dotfiles-personal/profile.d/ \( -name '*.sh' \))
  do
    profilename=$(basename "${profilepath}")
    sudo ln -sf $profilepath /etc/profile.d/personal-$profilename
  done
fi
