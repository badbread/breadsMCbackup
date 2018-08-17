#!/usr/bin/env bash


## Let's try to get this RCON CLI to send some data to librenms ##

# user entered variables
host="10.1.1.4" #enter RCON host here
port="25575"
pw="password"

# Store the output of the rcon-cli output to a variable
tps="$(./rcon-cli --host $host --port $port --password $pw tps)"

# Store the output above to an array seperated by ,
IFS=', ' read -r -a array <<< "$tps"


echo ${array[5]} " <- Array5 Value"
echo ${array[6]} " <- 1m TPS Value"
echo ${array[7]} " <- 5m TPS Value"
echo ${array[8]} " <- 15m TPS Value"

tps1=${array[6]}
tps5=${array[7]}
tps15=${array[8]}


#echo "$1 should be 15m"
echo $tps1
echo $tps5
echo $tps15

### Debug stuff
# for d3bug
#echo "The array has ${#array[@]} elements"

#for element in "${array[@]}"
#    do
#        echo "$element"
#      done
# echo $tps "<- this is the original output"