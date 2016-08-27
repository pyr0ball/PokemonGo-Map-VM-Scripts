#!/bin/bash
git stash
git pull origin master
git stash pop
cd ~/PokemonGo-Map

#check current installation's status
git status

#look for conflicts before pull
### will create more stuff here later ###
git stash
git pull origin develop
git stash pop

sudo -H pip install -r requirements.txt --upgrade
sudo npm install
sudo npm run build


