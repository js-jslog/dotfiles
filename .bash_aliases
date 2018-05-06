# universals
alias sourcerc="source ~/.bashrc"

alias ao="agenton"
alias sshconfig="less $HOME/.ssh/config"

alias downs="cd ~/Downloads"

# fix vim copy (apparently)
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

# accessing systemctl information
alias jctl="journalctl -xe"
alias tomcatservice="systemctl cat tomcat.service"

# list the configuration variables on the localhost
alias ansiblevars="ansible -m setup localhost"

# remove exited docker containers
alias rm-docker-containers="sudo docker ps -aq --no-trunc -f status=exited | sudo xargs docker rm"

# home navigation
alias beast="cd /mnt/md0/Beast/"
alias video="cd /mnt/md0/Beast/Video/"
alias nis="cd /mnt/md0/Beast/Study/spanish/notes_in_spanish_premium/notes_in_spanish_premium_pack2/"
alias film="cd /mnt/md0/Beast/Video/Film/"
alias tv="cd /mnt/md0/Beast/Video/TV/"
alias development="cd /mnt/md0/Beast/development/"

# ls
alias la="ls -lha"

# git
alias gs="git status"
alias gd="git diff"
alias gdt="git difftool"
alias gps="git push"
alias gpl="git pull"
alias gc="git commit -am"
alias gb="git checkout -b"
alias gl="git log"
alias gf="git fetch"
alias gm="git checkout master"
alias ga="git add --all"

# ctags
alias buildtags="ctags -R --exclude=node_modules --exclude=.git"
