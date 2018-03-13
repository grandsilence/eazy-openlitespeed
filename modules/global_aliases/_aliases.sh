alias bashrc-reload='source $HOME/.bashrc'
alias bashrc='vi $HOME/.bashrc; source $HOME/.bashrc;'

# Global edit b
alias als='cat /etc/profile.d/00-aliases.sh; echo \n\nCMDs: als-update'
alias als-update='pushd /usr/local/eazy-openlitespeed && git reset HEAD --hard && git pull && popd && source /etc/profile.d/00-aliases.sh'

# Users 
alias root="su - root"
alias me="su - me"

# Litespeed edit and cd
LS_DIR=/usr/local/lsws
alias cdls="cd $LS_DIR"
alias cdwww="cd $LS_DIR/sites"
alias cdcert="cd $LS_DIR/conf/cert"
alias cdvhosts="cd $LS_DIR/conf/vhosts"
alias viconf="vi $LS_DIR/conf/httpd_config.conf"

# Php
alias art="php artisan"

# Git
alias gp="git pull"
alias grh="git reset HEAD --hard"

# Files
# remove force recurs (for removing dirs)
alias rmf="rm -rf"
# display list folder with rights
alias la="ls -la" 
# make symlink
alias lns="ln -s" 
# copy recurs with saving owners and ch rights
alias cprp="cp -rp"

# Yum
alias yumi="yum -y install"
alias yumu="yum -y update"
alias yumr="yum -y remove"
