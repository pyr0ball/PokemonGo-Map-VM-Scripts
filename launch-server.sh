#!/bin/bash
cd PokemonGo-Map
## configurations ##

# Account configs
	# logins processed from ~/PokemonGo-Map/config/accounts.csv
	# format: auth,user,pass
mainaccts=config/accounts.csv
# beeaccts=config/beehive.csv

# server configuration
locale=en
location="some,location"
scandelay="-sd 30"
logindelay="-ld 15"
loginretry="-lr 3"
maxfail="-mf 3"
jitter="-j"
steps=7
GAPI=INSERT_GMAPS_API_KEY_HERE
executable=runserver.py

# Database configuration (MySQL / MariaDB is strongly recommended)
dbtype="--db-type mysql"
dbname="--db-name pogom"
dbuser="--db-user pogom"
dbpass="--db-pass pogom"
dbhost="--db-host localhost"
dbcon="--db-max_connections 100"

# Webserver configuration
host=0.0.0.0
port=5000
#proxy="-px socks5://127.0.0.1:9050"
#webhooks="-wh http://webhooksaddress:port --webhooks-updates-only"
#webhookth="--wh-threads 2"

# Scan Parsing Config
#nopokes="-np"
#nogyms="-ng"
#nopstops="-nk"
#gyminfo="-gi"

## Magic csv parsing ##
auth=$(while IFS="," read -r value1 remainder; do echo -a $value1 | tr '\n' ' ' ; done < "$mainaccts")
# beeauth=$(while IFS="," read -r value1 remainder; do echo -a $value1 | tr '\n' ' ' ; done < "$beehiveaccts")
username=$(while IFS="," read -r value1 value2 remainder; do echo -u $value2 | tr '\n' ' ' ; done < "$mainaccts")
# beehive=$(while IFS="," read -r value1 value2 remainder; do echo -u $value2 | tr '\n' ' ' ; done < "$beehiveaccts")
password=$(while IFS="," read -r value1 value2 value3 remainder; do echo -p $value3 | tr '\n' ' ' ; done < "$mainaccts")
# beepass=$(while IFS="," read -r value1 value2 value3 remainder; do echo -p $value3 | tr '\n' ' ' ; done < "$beehiveaccts")


#Uncomment the "while" loop to set the server to restart the map process every 4 hours
#while true
#        do

	### ~Home location~ ###
	pkill -f runserver.py
#               nohup proxychains4 python $executible -os  "$location" $dbtype $dbname $dbuser $dbpass $dbhost $dbcon -k $GAPI -H $host -P $port &

	nohup python $executable $auth $username $password -l "$location" -H $host -P $port -dc -st $steps -k $GAPI -L $locale $thread $scandelay $logindelay $loginretry $maxfail $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $jitter $webhooks $webhookth $nopokes $nogyms $nopstops $gyminfo &
	if [ "$?" -eq "1" ] ; then
		echo Something went wrong on launch. Please check Map Configuration...
		sleep 15
	fi
	sleep 5
	xdg-open "http://localhost:$port"
	tail -f nohup.out



# Uncomment the lines below to use beehive workers. Use them as examples, copy and paste new ones for as many as you may need. The current set is enough workers for one ring/leap
	### ~Beehive Workers~###
	# sleep 2
	# nohup  python $executable -a $auth $beehive $beepass -l "REPLACE_ME" -dc -st $steps -H 0.0.0.0 -P 5000 -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns
	# sleep 2
# nohup  python $executable -a $auth $beehive $beepass -l "REPLACE_ME" -dc -st $steps -H 0.0.0.0 -P 5000 -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns
	# sleep 2
	# nohup  python $executable -a $auth $beehive $beepass -l "REPLACE_ME" -dc -st $steps -H 0.0.0.0 -P 5000 -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns
	# sleep 2
	# nohup  python $executable -a $auth $beehive $beepass -l "REPLACE_ME" -dc -st $steps -H 0.0.0.0 -P 5000 -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns
	# sleep 2
	# nohup  python $executable -a $auth $beehive $beepass -l "REPLACE_ME" -dc -st $steps -H 0.0.0.0 -P 5000 -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns
	# sleep 2
	# nohup  python $executable -a $auth $beehive $beepass -l "REPLACE_ME" -dc -st $steps -H 0.0.0.0 -P 5000 -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns
#                sleep 14400
#        done

