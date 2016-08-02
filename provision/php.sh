sudo apt-get install php5-mysql
sudo apt-get install -y php5
sudo apt-get install php5-mcrypt -y
sudo apt-get install php5-curl -y
sudo apt-get install php5-xdebug -y
sudo apt-get install php5-imagick -y
sudo php5enmod imagick
sudo php5dismod xdebug
sudo apt-get install php5-mysql




sudo php5enmod mcrypt
sudo cp /vagrant/php-cli.ini /etc/php5/cli/php.ini
sudo cp /vagrant/php.ini /etc/php5/apache2/php.ini
sudo cp /vagrant/hosts /etc/hosts