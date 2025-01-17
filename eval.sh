#!/bin/bash

LOG_FILE=eval.logs

if [-f "$LOG_FILE"}; then 
    rm -rf "$LOG_FILE"
    echo "$LOG_FILE  is deleted"
else 
    echo "$LOG_FILE not exist..."
fi 

commands=("pwd" "ls -l" "echo hi ")


for cmd in "${commands[@]}"
do 
     echo "we are executing this command : $cmd" | tee -a $LOG_FILE
     eval $cmd 2>&1 | tee -a $LOG_FILE 
     echo -e "\n-------------------------------\n" | tee -a $LOG_FILE
done 
