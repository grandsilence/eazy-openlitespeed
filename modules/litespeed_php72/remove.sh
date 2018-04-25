yum -y remove lsphp72 lsphp72-bcmath lsphp72-common lsphp72-gd lsphp72-imap lsphp72-json lsphp72-mbstring lsphp72-mysqlnd lsphp72-opcache lsphp72-pdo lsphp72-pecl-mcrypt lsphp72-process lsphp72-soap lsphp72-xml lsphp72-zip

LOCAL_BIN=/usr/local/bin/
MAIN_BIN=/usr/bin/

function return_original_bin {
	local BIN_TARGET=$1
	local BACKUP_BIN=$BIN_TARGET'-old'
	
	if [ -f $BACKUP_BIN ]; then
		mv -f $BACKUP_BIN $BIN_TARGET
		chmod a+rx $BIN_TARGET

	    echo "INFO: Original bin returned from backup: $BACKUP_BIN => $BIN_TARGET"
    	return
	fi

	rm -f $BIN_TARGET
	echo "INFO: Removed bin $BIN_TARGET"
}

return_original_bin $MAIN_BIN'php'
return_original_bin $MAIN_BIN'php-cgi'
