alias bashrc-reload='source $HOME/.bashrc'
alias bashrc='vi $HOME/.bashrc; source $HOME/.bashrc;'

# Global edit b
alias als='cat /etc/profile.d/00-aliases.sh; echo \n\nCMDs: als-update'
alias als-update='pushd /usr/local/eazy-openlitespeed && git pull && popd && source /etc/profile.d/00-aliases.sh'

# Users 
alias root="su - root"
alias me="su - me"

# Php
alias art="php artisan"

# Git
alias gp="git pull"
alias grh="git reset HEAD --hard"

# Files
alias rmf="rm -rf"
alias la="ls -la"
alias lns="ln -s"

# Yum
alias yumi="yum -y install"
alias yumu="yum -y update"
alias yumr="yum -y remove"
