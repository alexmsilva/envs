#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y language-pack-en-base

# avoid locale warning message
sudo locale-gen en_US.UTF-8
sudo touch /var/lib/cloud/instance/locale-check.skip
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

sudo apt-get remove apache

sudo apt-get install -y nginx

# basic PHP install
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.2
sudo apt-get install -y php7.2-xml
sudo apt-get install -y php7.2-mysql
sudo apt-get install -y php7.2-mbstring
sudo apt-get install -y php7.2-zip
sudo apt-get install -y php7.2-soap

#install composer
# php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# php composer-setup.php --filename=composer
# php -r "unlink('composer-setup.php');"