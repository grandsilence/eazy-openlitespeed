wget -O installer.php https://getcomposer.org/installer
php installer.php --filename="composer" --install-dir=/usr/local/bin
rm -f installer.php
chmod a+rx /usr/local/bin/composer
