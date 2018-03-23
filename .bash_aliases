# universals
alias sourcerc="source ~/.bashrc"
alias modal="vim ~/.bash_aliases && source ~/.bashrc"
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


# rullion navigation
alias 04="cd ~/rsl/webapps/R6_04"
alias 12="cd ~/rsl/webapps/R6_12"
alias 13="cd ~/rsl/webapps/R6_13"
alias 14="cd ~/rsl/webapps/R6_14"
alias 15="cd ~/rsl/webapps/R6_15"
alias 16="cd ~/rsl/webapps/R6_16"
alias 17="cd ~/rsl/webapps/R6_17"
alias 18="cd ~/rsl/webapps/R6_18"
alias 19="cd ~/rsl/webapps/R6_19"
alias 20="cd ~/rsl/webapps/R6_20"
alias 21="cd ~/rsl/webapps/R6_21"
alias 22="cd ~/rsl/webapps/R6_22"
alias 23="cd ~/rsl/webapps/R6_23"
alias 24="cd ~/rsl/webapps/R6_24"
alias 25="cd ~/rsl/webapps/R6_25"

alias ansible-rsl="cd ~/rsl/ansible-rsl"
alias tomcat="cd ~/rsl/tomcat"
alias cdn="cd ~/rsl/webapps/cdn"
alias logs="cd ~/rsl/logs"
alias webapps="cd ~/rsl/webapps/"

alias cstart="sh ~/rsl/tomcat/bin/catalina.sh start"
alias cstop="sh ~/rsl/tomcat/bin/catalina.sh stop"
