#!/usr/bin/env bash

sudo apt-get update

# avoid locale warning message
sudo touch /var/lib/cloud/instance/locale-check.skip
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# basic mysql install
echo "mysql-server mysql-server/root_password password rooter" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password rooter" | debconf-set-selections
sudo apt-get install -y mysql-server
