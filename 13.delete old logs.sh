#!/bin/bash


DATE=$(date +%F:%H:%M:%S)
APP_LOGS_DIR=/home/centos/app-logs
LOGDIR=/home/centos/test-scripting/script_logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$0-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "script started excuting at $DATE" &>> LOGFILE

while read line
do
   echo "deleting $line" &>> $LOGFILE
   rm -rf $line
   done <<< $FILES_TO_DELETE


