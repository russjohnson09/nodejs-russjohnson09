#!/usr/bin/env bash

sudo cp /vagrant/etc/sudoers /etc/sudoers

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# update / upgrade
#sudo apt-get -y upgrade
sudo apt-get install curl -y

sudo apt-get install jenkins -y
#sudo dpkg --configure -a

#sudo npm install --save request
