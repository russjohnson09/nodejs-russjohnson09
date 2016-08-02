
#nodejs
curl -sL https://deb.nodesource.com/setup | sudo bash - #http://stackoverflow.com/questions/12913141/message-failed-to-fetch-from-registry-while-trying-to-install-any-module
sudo apt-get install nodejs -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install build-essential -y
#sudo npm install -g request

sudo npm cache clean -f

sudo npm install -g n

sudo n stable


sudo rm /usr/bin/node

sudo ln -s /usr/bin/node /usr/local/n/versions/node/6.2.2
