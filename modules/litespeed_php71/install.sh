yum -y install lsphp71 lsphp71-common lsphp71-mysqlnd lsphp71-gd lsphp71-process lsphp71-mbstring lsphp71-xml lsphp71-mcrypt lsphp71-pdo lsphp71-opcache lsphp71-json lsphp71-soap lsphp71-bcmath lsphp71-imap lsphp71-zip

LSWS_DIR=/usr/local/lsws

# Append fast cgi LSAPI
ln -sf "$LSWS_DIR/lsphp71/bin/lsphp" "$LSWS_DIR/fcgi-bin/lsphp7"
chown -R lsadm:lsadm "$LSWS_DIR/conf"

## Install PHP 7.1 as main PHP in bash (instead 5.6)
MAIN_BIN=/usr/bin
function replace_bin_symlink {
	local BIN_SOURCE=$1
	local BIN_TARGET=$2

	if [ ! -f $BIN_SOURCE ]; then
	    echo "ERROR: Source bin file $BIN_SOURCE not found!"
    	return
	fi

	if [ -f $BIN_TARGET ]; then
	    local BACKUP_BIN=$BIN_TARGET'-old'
		mv -f $BIN_TARGET $BACKUP_BIN
		chmod a+rx $BACKUP_BIN

		echo "INFO: Prev bin file migrated $BIN_TARGET => $BACKUP_BIN"
	fi

	# Move new bin as symlink
	ln -s $BIN_SOURCE $BIN_TARGET
	chmod a+rx $BIN_SOURCE
	chmod a+rx $BIN_TARGET
	echo "SUCCESS: Bin appended $BIN_TARGET => $BIN_SOURCE"
}
replace_bin_sym /usr/local/lsws/lsphp71/bin/php $MAIN_BIN'/php'
replace_bin_sym /usr/local/lsws/lsphp71/bin/php-cgi $MAIN_BIN'/php-cgi'

litespeed restart
