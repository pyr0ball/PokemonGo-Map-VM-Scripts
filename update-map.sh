#!/bin/bash
mv launch-server.sh launch-server.$(date +"%Y%m%d%H%M").old
git pull origin master
cd ~/PokemonGo-Map

#check current installation's status
git status

#look for conflicts before pull
### will create more stuff here later ###

git pull

sudo -H pip install -r requirements.txt --upgrade
sudo npm install
sudo npm run build
rm ~/.trash/*
