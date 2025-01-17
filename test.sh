#!/bin/bash

#-e : script stops if found error , -u if variavle used as unassigned value gives issue
set -eu

function log_message(){
	#  2>&1 redirect both stdout and stderr messgaes  Note echo "" &> script.log is also equivalent to  echo "" > script.log 2>&1
	echo "$(date) $1" 2>&1 | tee -a  script.log # tee -a is use for append  
}

if [ -f script.logs ]; then
    echo "script.logs file is deleted"
    rm -rf script.logs
else
   echo "no script.logs file present this created as logs recieved"
fi



log_message "enter the boolean value of flag i.e true or false :"
read flag

log_message "value of flag is : $flag" 
mainDir="/home/aedev/practice"

log_message "Directory change to working dir $mainDir"
cd "$mainDir"

if [ $flag == "true" ]; then
    echo "my name is $1 $2" > "$1"_"$2"
    log_message "file of your name is createad..."
else 
    rm -rf "$1"_"$2"
    log_message "$1 $2 your file is deleted"
fi 
