yum -y remove lsphp71 lsphp71-common lsphp71-mysqlnd lsphp71-gd lsphp71-process lsphp71-mbstring lsphp71-xml lsphp71-mcrypt lsphp71-pdo lsphp71-opcache lsphp71-json lsphp71-soap lsphp71-bcmath lsphp71-imap lsphp71-zip

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
