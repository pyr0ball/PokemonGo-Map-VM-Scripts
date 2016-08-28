#!/bin/bash
# Specify an accounts file to use. By default, will check accounts currently configured for use with the map
rm PoGoAccountCheck/accounts.txt
accounts="PokemonGo-Map/config/accounts.csv"
readout=$(while IFS="," read -r value1 value2 value3 remainder; do echo -e $value2:$value3 \ >> PoGoAccountCheck/accounts.txt ; done < "$accounts")
echo Please specify a location. We need this to attempt a login.
read location
cd PoGoAccountCheck
python banned.py -f accounts.txt -l "$location"
