#!/usr/bin/env bash


## Let's try to get this RCON CLI to send some data to librenms ##

# user entered variables
host="10.1.1.4" #enter RCON host here
port="25575"
pw="password"

# Store the output of the rcon-cli output to a variable
tps="$(./rcon-cli --host $host --port $port --password $pw tps)"


# Store the output above to an array seperated by ,
IFS='§a' read -r -a array <<< "$tps"

#why is this here??
echo "<<<rconmc>>>"

# this is 1mTPS
echo ${array[4]} | tr ',' '\r'
# This is 5mTPS
echo ${array[6]} | tr ',' '\r'
# this is 15m TPS
echo ${array[8]} | tr ',' '\r'






tps1m="${array[4]}"
tps5m="${array[6]}"
tps15m="${array[8]}"

#echo $tps1m
#echo $tps5m
#echo $tps15m
