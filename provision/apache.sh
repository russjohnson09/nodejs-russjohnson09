# install apache 2.5 and php 5.5
sudo apt-get install -y apache2



# enable mod_rewrite
sudo a2enmod rewrite
sudo a2enmod ssl


# restart apache
service apache2 restart