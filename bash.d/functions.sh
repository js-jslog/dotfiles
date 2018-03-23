#! /bin/bash
function buildvim {
  sudo rm -r ~/.vim || true
  git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}
function deploybash {
  cp ~/dotfiles/.bash_functions_rsl ~/.
  source ~/.bashrc
}
function appmap {
  APP=$1
  if [[ -z "${ANSIBLE}" ]]; then
    ANSIBLE="$HOME/rsl/ansible-rsl"
  fi
  ENV_MAPPINGS="$ANSIBLE/roles/apache/files/rsl_env_mappings.conf"
  SERVER=$(cat $ENV_MAPPINGS | grep $APP | grep -oE '[^ ]+$')
  printf $SERVER
}
function dbmap {
  APP=$1
  if [[ -z "${ANSIBLE}" ]]; then
    ANSIBLE="$HOME/rsl/ansible-rsl"
  fi
  SERVICE_VARS="$ANSIBLE/service_vars/$APP.yml"
  SERVER=$(cat $SERVICE_VARS | grep DB_HOST | grep -oE '[^ ]+$')
  printf $SERVER
}
function sshapp {
  APP=$1
  SERVER=$(appmap $APP)
  RHINO=''
  RHINO='./rhino.sh -e "load(\"main.js\")" -f -;'
  BASH='/bin/bash;'
  ssh $SERVER -t 'command cd /home/rsl/webapps/'$APP'; ' $RHINO $BASH
}
function sshdb {
  APP=$1
  SERVER=$(dbmap $APP)
  ssh $SERVER
}
function loadrhino {
  ./rhino.sh -e "load(\"main.js\")" -f -
}
function rsl {
  APP=$1
  if [[ $APP =~ "_dev" ]]; then
    cd ~/rsl/webapps/$APP
    loadrhino
  else
    sshapp $APP
  fi
}
