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
LS_VHOSTS="$LS_DIR/conf/vhosts"

alias cdls="cd $LS_DIR"
alias cdwww="cd $LS_DIR/sites"
alias cdcert="cd $LS_DIR/conf/cert"
alias cdvhosts="cd $LS_VHOSTS"
alias viconf="vi $LS_DIR/conf/httpd_config.conf"

# Edit vhost configuration
function vivhost {
	local VH_NAME=$1
	if [ -z $VH_NAME ]; then
		echo "Edit vHost configuration"
		echo "Usage: vivhost <vhost_name>"
		return
	fi

	local VHOST_FILE="$LS_VHOSTS/$VH_NAME/vhconf.conf"
	if [ ! -f $VHOST_FILE ]; then
	    echo "ERROR: vHost $VHOST_FILE not found!"
    	return
	fi

	vi $VHOST_FILE
}

# Copy vhost folder with all configuration
function cphost {
	local SOURCE_VHOST=$1
	local DEST_VHOST=$1

	# Params is set
	if [ -z $SOURCE_VHOST ] || [ -z $DEST_VHOST ]; then
		echo "Copy vHost folder with all configuration"
		echo "Usage: cphost <source_vhost_name> <destonation_vhost_name>"
		return 1
	fi

	# Source is exists
	local SOURCE_VHOST_PATH="$LS_VHOSTS/$SOURCE_VHOST"
	if [ ! -d $SOURCE_VHOST_PATH ]; then
	    echo "ERROR: Source vHost not found: $SOURCE_VHOST_PATH"
    	return 1
	fi

	# Check dest rewrite
	local DEST_VHOST_PATH="$LS_VHOSTS/$DEST_VHOST"
	if [ -d $DEST_VHOST_PATH ]; then
	    echo "ERROR: Dest vHost already exists: $DEST_VHOST_PATH"	    
		read -p "Rewrite? (Y/n)" ANSWER
		if [[ ! $ANSWER =~ ^[Yy]$ ]]
		then
		    return 1
		fi

		rm -rf $DEST_VHOST_PATH
	fi
	
	cp -rp $SOURCE_VHOST_PATH $DEST_VHOST_PATH
    echo "SUCCESS: vHost cloned $DEST_VHOST_PATH"
    return 0
}

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
