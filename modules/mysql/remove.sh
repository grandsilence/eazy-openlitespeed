# TODO: remove rpm
# rpm -ivh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

systemctl disable mysqld
systemctl stop mysqld
yum -y remove mysql-server
