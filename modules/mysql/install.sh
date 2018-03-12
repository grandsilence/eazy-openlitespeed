rpm -ivh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

yum -y install mysql-server
systemctl enable mysqld
systemctl start mysqld

read -p "Start MYSQL wizard config?" ANSWER
if [[ $ANSWER =~ ^[Yy]$ ]]
then
    mysql_secure_installation
fi
