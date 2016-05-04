#!/usr/bin/env bash

sudo apt-get update

# avoid locale warning message
sudo touch /var/lib/cloud/instance/locale-check.skip
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# basic apache install
sudo apt-get install -y apache2

# custom apache config
sudo touch /etc/apache2/conf-available/custom.conf
echo -e "ServerName\\tlocalhost" | sudo tee /etc/apache2/conf-available/custom.conf >> /dev/null
sudo a2enconf custom >> /dev/null

sudo a2enmod rewrite

# basic PHP install
sudo apt-get install -y php5
sudo apt-get install -y libapache2-mod-php5
sudo apt-get install -y php5-mcrypt
sudo apt-get install -y php5-curl

# custom PHP config
sudo touch /var/www/html/info.php
echo -e "<?php\\nphpinfo();\\n?>" | sudo tee /var/www/html/info.php >> /dev/null
sudo service apache2 restart

sudo service apache2 restart

# install composer
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'a52be7b8724e47499b039d53415953cc3d5b459b9d9c0308301f867921c19efc623b81dfef8fc2be194a5cf56945d223') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
