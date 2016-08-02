#!/usr/bin/env bash

sudo su - vagrant

PASSWORD='test'

# install mysql and give password to installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server

sudo cp /vagrant/my.cnf /etc/mysql/my.cnf
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -uroot -ptest mysql

mysql -uroot -ptest < /vagrant/users.sql

sudo service mysql restart