rpm -ivh http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el7.noarch.rpm
yum -y install openlitespeed

# Firewall
# ------------------------------
firewall-cmd --zone=public --add-port=7080/tcp --permanent
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

LSWS_PATH=/usr/local/lsws
chown -R lsadm:lsadm $LSWS_PATH'/conf'
chmod a+rx $LSWS_PATH'/admin/misc/admpass.sh'

LOCAL_BIN=/usr/local/bin

read -p "Reset admin litespeed? (Y/n)" ANSWER
if [[ $ANSWER =~ ^[Yy]$ ]]
then
    bash $LSWS_PATH'/admin/misc/admpass.sh'
fi

litespeed restart
