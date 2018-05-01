#! /bin/bash
function buildvim {
  sudo rm -r ~/.vim || true
  git clone git@github.com:k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
  vim -c "call minpac#update() | qall"
}

function agenton {
  if [ ! $SSH_AGENT_PID ]; then
    echo starting agent
    ssh-agent bash -c "ssh-add; bash -i"
  else
    echo agent already running
  fi
}
