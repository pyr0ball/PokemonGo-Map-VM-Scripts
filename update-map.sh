#!/bin/bash
#PokemonGo-Map-VM Update Script v0.2.5
<<<<<<< HEAD

=======
cwd=$(pwd)
>>>>>>> 74291d2c9f8c78ae31e33825433fe98bed3a4b3f
## Check current version against master on gitHub. Run update on VM scripts if version mismatch
git checkout .version
ver=$(cat .version)
if [ "$ver" != "v0.2.5" ] ; then
<<<<<<< HEAD
	git stash > update-script.log
	git pull origin master > update-script.log
	git stash pop > update-script.log
	echo VM-Scripts updated to $ver! The Map Updater will now re-run
=======
	git stash > $cwd/update-script.log
	git pull origin master > $cwd/update-script.log
	git stash pop > $cwd/update-script.log
	echo VM-Scripts updated to $ver! $cwd/The Map Updater will now re-run
>>>>>>> 74291d2c9f8c78ae31e33825433fe98bed3a4b3f
	sleep 5
	sh ./update-map.sh
else
	cd $cwd/PokemonGo-Map
	echo Now Updating PokemonGo-Map
	#git pull map files, merge end-user changes
	git stash > $cwd/update-script.log
	git checkout develop > $cwd/update-script.log
	git pull > $cwd/update-script.log
	git stash pop > $cwd/update-script.log
	
	#run install steps on map
	sudo -H pip install -r requirements.txt --upgrade
	sudo npm install
	sudo npm run build
	
	#git pull ptc-gen-files
	echo Now updating ptc-acc-gen
	cd $cwd/ptc-acc-gen
	git stash > $cwd/update-script.log
	git checkout master > $cwd/update-script.log
	git pull > $cwd/update-script.log
	git stash pop > $cwd/update-script.log
fi
