yum -y remove openlitespeed
# TODO: remove rpm
# rpm - http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el7.noarch.rpm

# Firewall remove
firewall-cmd --zone=public --remove-port=7080/tcp

read -p "Remove firewall HTTP and HTTPS PROTO? (Y/n)" ANSWER
if [[ $ANSWER =~ ^[Yy]$ ]]
then
    firewall-cmd --zone=public --remove-service=http
	firewall-cmd --zone=public --remove-service=https
fi
firewall-cmd --reload

# Symlinks remove
LOCAL_BIN=/usr/local/bin
rm -f $LOCAL_BIN'/litespeed'
rm -f $LOCAL_BIN'/litespeed-reset'

# Litespeed data dir remove
LSWS_PATH=/usr/local/lsws
read -p "Remove $LSWS_PATH? (Y/n)" ANSWER
if [[ $ANSWER =~ ^[Yy]$ ]]
then
    rm -rf $LSWS_PATH
fi
