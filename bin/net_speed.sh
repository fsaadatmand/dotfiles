#!/bin/bash

# This shell script shows the network speed, both received and transmitted.

# Usage: net_speed.sh interface
#   e.g: net_speed.sh eth0


# Global variables
interface=$1
received_bytes=""
old_received_bytes=""
transmitted_bytes=""
old_transmitted_bytes=""


# This function parses /proc/net/dev file searching for a line containing $interface data.
# Within that line, the first and ninth numbers after ':' are respectively the received and transmited bytes.
function get_bytes
{
line=$(cat /proc/net/dev | grep $interface | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
eval $line
}


# Function which calculates the speed using actual and old byte number.
# Speed is shown in KByte per second when greater or equal than 1 KByte per second.
# This function should be called each second.
function get_velocity
{
value=$1    
old_value=$2

let vel=$value-$old_value
let velKB=$vel/1000
let velMB=$vel/1000000
if [ $velMB != 0 ];
then
echo -n "$velMB MB/s";
elif [ $velKB != 0 ];
then
echo -n "$velKB KB/s";
else
echo -n "$vel B/s";
fi
}

#error and quit if no interface specified
if (( $# != 1 )); then
 echo "Illegal number of parameters."
 echo "Usage: $0 network_interface"
 exit 1
fi

# Gets initial values.
get_bytes
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes

# Shows a message and waits for one second.
#echo "Starting...";
#sleep 1;
#echo "";


# Main loop. It will repeat forever.
while true; 
do

# Get new transmitted and received byte number values.
get_bytes

# Calculates speeds.
vel_recv=$(get_velocity $received_bytes $old_received_bytes)
vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes)

#clear current line (\033[2K), move cursor back to start (\r)
echo -en "\033[2K\r"

# Shows results in the console.
#echo -en "$interface DOWN:$vel_recv\tUP:$vel_trans\r"
printf "DOWN:%10s\tUP:%10s\r" "$interface" "$vel_recv" "$vel_trans"

# Update old values to perform new calculations.
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes

# Waits one second.
sleep 1;

done
