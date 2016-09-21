#!/bin/bash
cd PokemonGo-Map
## configurations ##

# Account configs
	# logins processed from PokemonGo-Map/config/accounts.csv
	# format: auth,user,pass
mainaccts=config/accounts.csv
beeaccts=config/beehive.csv

# server configuration
locale=en
location="Santa Monica Pier"

# Worker Management:
#workers="-w 20"		| # Maximum numnber of active accounts at one time
#searchint="-asi 7200"	| # Maximum search time before account "rest"
#restint="-ari 7200"	| # Minimum "rest" time before cycling account into queue
#spawnpoints="-ss"		| # Uncomment to enable Spawnpoint Scanning
scandelay="-sd 30"		| # Time each worker will wait before scanning next cell
logindelay="-ld 15"		| # Wait period between login attempts after failure
loginretry="-lr 3"		| # Number of login retries before abandoning account
maxfail="-mf 3"			| # Max number of consecutive failed scans before account is disabled from search queue
jitter="-j"				| # Uncomment to enable "jitter" in location. (Makes detection of account as mapper more difficult)
steps=7					| # Radius of Search Area in "Steps" (~70 meters)
GAPI=INSERT_gMAPS_apiKEyHERE
executable=runserver.py
#logfile="-v pogomap.log" | # Uncomment to enable output to log

# Database configuration (MySQL / MariaDB is strongly recommended)
dbtype="--db-type mysql"
dbname="--db-name pogom"
dbuser="--db-user pogom"
dbpass="--db-pass pogom"
dbhost="--db-host localhost"
#dbcon="--db-max_connections 100"	| # Uncomment and increase max connections if you get an error like "not enough db connections
#dbthr="--db-threads 50"	| # Uncomment and increase db threads if db I/O complains of falling behind

# Webserver configuration
host=0.0.0.0
port=5000
#proxy="-px socks5://127.0.0.1:9050"
#webhooks="-wh http://webhooksaddress:port --webhooks-updates-only"
#webhookth="--wh-threads 2"

# Scan Parsing Config
#nopokes="-np"		| # Uncomment to disable scanning for pokemon
#nogyms="-ng"		| # Uncomment to disable scanning Gyms
#nopstops="-nk"		| # Uncomment to disable scanning pokestops
#gyminfo="-gi"		| # Uncomment to enable scanning Gym Information

#############################################################
#					End of Configuration 					#
#############################################################


## Magic csv parsing ##
maincsv="-ac $mainaccts"

beecsv="-ac $beeaccts"


#Uncomment the "while" loop to set the server to restart the map process every 4 hours
#while true
#        do

	### ~Home location~ ###
	pkill -f runserver.py
#               nohup proxychains4 python $executible -os  "$location" $dbtype $dbname $dbuser $dbpass $dbhost $dbcon -k $GAPI -H $host -P $port &

python $executable $maincsv -l "$location" -H $host -P $port -st $steps -k $GAPI -L $locale $thread $scandelay $logindelay $loginretry $maxfail $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $jitter $webhooks $webhookth $nopokes $nogyms $nopstops $gyminfo $searchint $restint $workers $logfile $spawnpoints -ps -vv debug.log
	if [ "$?" -eq "1" ] ; then
		echo Something went wrong on launch. Please check Map Configuration...
		sleep 15
	fi
	sleep 5
#	xdg-open "http://localhost:$port"
#	tail -f nohup.out



# Uncomment the lines below to use beehive workers. Use them as examples, copy and paste new ones for as many as you may need. The current set is enough workers for one ring/leap
	### ~Beehive Workers~###
	 sleep 2
#	 nohup python $executable $beecsv -l "37.784765, -122.294005" -dc -st 7 -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns &
	# sleep 2
# nohup  python $executable $beecsv -l "REPLACE_ME" -dc -st $steps -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns &
	# sleep 2
	# nohup  python $executable $beecsv -l "REPLACE_ME" -dc -st $steps -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns &
	# sleep 2
	# nohup  python $executable $beecsv -l "REPLACE_ME" -dc -st $steps -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns &
	# sleep 2
	# nohup  python $executable $beecsv -l "REPLACE_ME" -dc -st $steps -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns &
	# sleep 2
	# nohup  python $executable $beecsv -l "REPLACE_ME" -dc -st $steps -k $GAPI -L $locale $thread $scandelay $dbtype $dbname $dbuser $dbpass $dbhost $dbcon $proxy $nopokes $nogyms $nopstops $gyminfo $jitter $logindelay $loginretry $maxfail -ns &
#                sleep 14400
#        done

