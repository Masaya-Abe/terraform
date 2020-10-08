#!/bin/sh

sudo yum -y install gcc-c++
sudo yum -y install git

git clone https://github.com/nvm-sh/nvm.git ~/.nvm
source ~/.nvm/nvm.sh

echo -e -n "\nif [[ -s ~/.nvm/nvm.sh ]] ; then\n   source ~/.nvm/nvm.sh\nfi\n\n" >> ~/.bash_profile

nvm install v12.18.3
nvm use v12.18.3
npm install express-generator -g

mkdir app
cd app/
express sample-app
cd sample-app
npm install
node ./bin/www &
