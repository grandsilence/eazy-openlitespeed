#!/usr/bin/bash

# Validate params
if [ "$#" -ne 3 ]; then
    echo 'Usage: <old.domain> <new.domain> <vhost_name>'
    exit 1
fi

cd /usr/local/lsws

# Init
OLD_DOMAIN=$1
NEW_DOMAIN=$2
VHOST_NAME=$3
# Escaped domains for regex
RX_OLD_DOMAIN=$(echo "$OLD_DOMAIN" | sed -e 's/\./\\\./g')
RX_NEW_DOMAIN=$(echo "$NEW_DOMAIN" | sed -e 's/\./\\\./g')
BAK_PREFIX=".rpbak"

if [ ! -d "sites/$VHOST_NAME" ]; then
    echo "ERROR: Website dir not found \"$VHOST_NAME\" not found! Available: "
    ls -dA1 ./sites/*
    exit 1
fi

#######################################
#    SSL Rights					      #
#######################################

SSL_FOLDER="conf/cert/$NEW_DOMAIN"
if [ ! -d $SSL_FOLDER ]; then
    echo "ERROR: SSL folder with certs \"$SSL_FOLDER\" not found! Available: "
    ls -dA1 conf/cert/*
	exit 1
fi

chown -R lsadm:lsadm $SSL_FOLDER
chmod -R 644 $SSL_FOLDER
chmod a+x $SSL_FOLDER

# Disabled for node js read key
# chmod 600 "$SSL_FOLDER/private.key"
echo "Successfuly changed rights for SSL keys $NEW_DOMAIN"


#######################################
function replace_in_target {
	# Check file existion
	if [ ! -f $TARGET ]; then
	    echo "ERROR: file $TARGET not found!"
    	exit 1
	fi

	# Backup file
	cp -f $TARGET "$TARGET$BAK_PREFIX"

	# Replace old domain to New
	sed -i "s/$RX_OLD_DOMAIN/$RX_NEW_DOMAIN/gi" $TARGET
	echo "Successfuly replaced in $TARGET"
}

echo "Host replacing $OLD_DOMAIN => $NEW_DOMAIN..."


#######################################
#         VHost config                #
#######################################

TARGET="conf/vhosts/$3/vhconf.conf"
replace_in_target


#######################################
#    Listeners HTTP, HTTPS. Config    #
#######################################

TARGET='conf/httpd_config.conf'
replace_in_target


#######################################
#    VHost Env / config Website       #
#######################################
cd "sites/$VHOST_NAME/html"

# Laravel env
TARGET='.env'
replace_in_target

# NodeJS Config bot 
TARGET='bot/config.js'
replace_in_target
