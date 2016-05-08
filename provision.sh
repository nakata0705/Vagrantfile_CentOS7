#!/bin/bash

sudo yum -y install glibc-static git

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile

nvm install 4.4.4
nvm alias default 4.4.4
	
git clone https://github.com/c9/core.git /home/vagrant/c9sdk
cd /home/vagrant/c9sdk
./scripts/install-sdk.sh
curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash
sudo cp /vagrant/c9sdk.service /lib/systemd/system/c9sdk.service
sudo chmod 644 /lib/systemd/system/c9sdk.service
sudo systemctl daemon-reload
sudo systemctl enable c9sdk
sudo systemctl start c9sdk

curl https://install.meteor.com/ | sh
git clone https://github.com/nakata0705/meteor-react-redux-boilerplate.git /home/vagrant/my-killer-app
cd /home/vagrant/my-killer-app/.client
npm install
npm install material-ui

#sudo -u vagrant git clone https://github.com/mz026/universal-redux-template.git /home/vagrant/my-killer-app
#cd /home/vagrant/my-killer-app; rm -rf .git; git init
#sudo -u vagrant npm install
#sudo -u vagrant npm install material-ui	
