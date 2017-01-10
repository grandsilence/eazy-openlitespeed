# Install Base Packages
# -----------------------------
yum -y install epel-release wget


# Install Litespeed and PHP 7.1
# -----------------------------
# lsphp71-mysql
rpm -ivh http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el7.noarch.rpm
yum -y install openlitespeed lsphp71 lsphp71-common lsphp71-mysqlnd lsphp71-gd lsphp71-process lsphp71-mbstring lsphp71-xml lsphp71-mcrypt lsphp71-pdo lsphp71-opcache lsphp71-json lsphp71-soap lsphp71-bcmath lsphp71-imap lsphp71-zip
ln -sf /usr/local/lsws/lsphp71/bin/lsphp /usr/local/lsws/fcgi-bin/lsphp7

alias litespeed='/usr/local/lsws/bin/lswsctrl'
echo "alias litespeed='/usr/local/lsws/bin/lswsctrl'" >> ~/.bashrc

alias litespeed_reset='/usr/local/lsws/admin/misc/admpass.sh'
echo "alias litespeed-reset='/usr/local/lsws/admin/misc/admpass.sh'" >> ~/.bashrc

chown -R lsadm:lsadm /usr/local/lsws/conf/*
# chmod -R 755 /usr/local/lsws/conf/*
chmod 600 "/usr/local/lsws/password"

# Install MySql
# -----------------------------
rpm -ivh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
yum -y install mysql-server phpmyadmin
systemctl start mysqld


# Install utilities
# -----------------------------
yum -y install git nodejs npm
npm install -g gulp

# Install prisma PIL
yum -y install python-imaging

# PHP 7.1 as default for composer
PATH="/usr/local/lsws/lsphp71/bin:$PATH"
echo "# Override PHP CLI to 7.1" >> ~/.bashrc
echo "PATH=\"/usr/local/lsws/lsphp71/bin:\$PATH\"" >> ~/.bashrc
echo "export PATH" >> ~/.bashrc

# Install composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer


# Update all packages
# ------------------------------
yum -y update

# Firewall
# ------------------------------
firewall-cmd --zone=public --add-port=22/tcp --permanent
firewall-cmd --zone=public --add-port=7080/tcp --permanent
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --reload


litespeed restart