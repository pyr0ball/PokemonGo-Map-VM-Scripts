#!/bin/bash
#PokemonGo-Map-VM Update Script v0.2.3

## Check current version against master on gitHub. Run update on VM scripts if version mismatch
git checkout .version
ver=$(cat .version)
if [ "$ver" != "v0.2.3" ] ; then
	git stash
	git pull origin master
	git stash pop
	sh ./update-map.sh
else
	cd PokemonGo-Map
	#git pull map files, merge end-user changes
	git stash
	git checkout develop
	git pull
	git stash pop
	
	#run install steps on map
	sudo -H pip install -r requirements.txt --upgrade
	sudo npm install
	sudo npm run build
	
	#git pull ptc-gen-files
	cd ../ptc-acc-gen
	git stash
	git checkout master
	git pull
	git stash pop
fi
