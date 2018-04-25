yum -y install lsphp72 lsphp72-bcmath lsphp72-common lsphp72-gd lsphp72-imap lsphp72-json lsphp72-mbstring lsphp72-mysqlnd lsphp72-opcache lsphp72-pdo lsphp72-pecl-mcrypt lsphp72-process lsphp72-soap lsphp72-xml lsphp72-zip

LSWS_DIR=/usr/local/lsws

# Append fast cgi LSAPI
ln -sf "$LSWS_DIR/lsphp72/bin/php" "$LSWS_DIR/fcgi-bin/lsphp"

## Install PHP 7.2 as main PHP in bash (instead 5.6)
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
	ln -sf $BIN_SOURCE $BIN_TARGET
	chmod a+rx $BIN_SOURCE
	chmod a+rx $BIN_TARGET
	echo "SUCCESS: Bin appended $BIN_TARGET => $BIN_SOURCE"
}
replace_bin_sym /usr/local/lsws/lsphp72/bin/php $MAIN_BIN'/php'
replace_bin_sym /usr/local/lsws/lsphp72/bin/php-cgi $MAIN_BIN'/php-cgi'

/usr/local/lsws/lswsctrl restart
