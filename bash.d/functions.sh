function buildvim {
  sudo rm -r ~/.vim || true
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
}

function agenton {
  if [ ! $SSH_AGENT_PID ]; then
    echo starting agent
    ssh-agent bash -c "ssh-add; bash -i"
  else
    echo agent already running
  fi
}
