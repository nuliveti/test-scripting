#!/bin/bash


DATE=$(date +%F)
APP_LOGS_DIR=/home/centos/app-logs
SCRIPT_NAME=$0
LOGFILE=$APP_LOGS_DIR/$0-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "$FILES_TO_DELETE"

while read line
do
   echo "deleting $line" &>> $LOGFILE
   rm -rf $line
   done <<<$FILES_TO_DELETE
