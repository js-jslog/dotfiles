#! /bin/bash
function buildvim {
  sudo rm -r ~/.vim || true
  git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

function agenton {
  if [ ! $SSH_AGENT_PID ]; then
    echo starting agent
    ssh-agent bash -c "ssh-add; bash -i"
  else
    echo agent already running
  fi
}
