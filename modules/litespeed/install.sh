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
# chmod 600 $LSWS_PATH'/password'

LOCAL_BIN=/usr/local/bin
ln -s $LSWS_PATH'/bin/lswsctrl' $LOCAL_BIN'/litespeed'
ln -s $LSWS_PATH'/admin/misc/admpass.sh' $LOCAL_BIN'/litespeed-reset'

read -p "Reset admin litespeed?" ANSWER
if [[ $ANSWER =~ ^[Yy]$ ]]
then
    litespeed-reset
fi

litespeed restart

# PHP 7.1 as default for composer
#echo "# Override PHP CLI to 7.1" >> ~/.bashrc
# echo "PATH=\"/usr/local/lsws/lsphp71/bin:\$PATH\"" >> ~/.bashrc
#echo "export PATH" >> ~/.bashrc
# source ~/.bashrc
