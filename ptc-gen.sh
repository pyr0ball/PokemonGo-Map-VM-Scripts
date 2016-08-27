#!/bin/bash
echo What username will your accounts use?
read username

echo Type a password for your accounts.
read password

echo What email address will you be using?
read email

euser="${email%@*}"
edomain="${email#*@}"

echo We need a location to activate the accounts. 
echo Type a latitude
read lat
echo Type a longitude
read lon

echo How many accounts will we make? Tell us a start and end value
echo Example: 0 - 9 will create 10 accounts ranging from $username/0 through $username/9
echo So whats our beginning value?
read begin
echo And our end?
read end

echo creating accounts named $username using pass $password registered to $euser@$edomain
echo Accounts will be activated at the location $lat , $lon
sleep 5

cd ptc-acc-gen
mv index.js index.js.$(date +"%Y%m%d%H%M").old
scp index.js.original index.js
sed -i s/USERNAME_PH/$username/g index.js
sed -i s/PASSWORD_PH/$password/g index.js
sed -i s/EMAIL_PH/$euser/g index.js
sed -i s/DOMAIN_PH/$edomain/g index.js
sed -i s/LATITUDE_PH/$lat/g index.js
sed -i s/LONGITUDE_PH/$lon/g index.js
sed -i s/START_NUM/$begin/g index.js
sed -i s/END_NUM/$end/g index.js
node index.js
cd PogoPlayer
node pogo.js
mv accounts.csv ~/PokemonGo-Map/config/accounts.$(date +"%Y%m%d%H%M").csv
echo Your accounts have been generated and saved to ~/PokemonGo-Map/config/accounts.$(date +"%Y%m%d%H%M").csv
sleep 10
