#!/bin/bash


#### im declaring all useful variavbles here
DATE=$(date +%F)
LOGDIR=/home/centos/test-scripting/script_logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$0-$DATE.log
USERID=$(id -u)


B="\e[36m"
P="\e[35m"
N="\e[0m"
Y="\e[33m"



if [ $USERID -ne 0 ];

then

    echo -e "$B ERROR: user dont have root privilege $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0];
    then
    echo -e "Installing $2.....$P failure $N"
    exit 1
    else
    echo -e "Installing $2......$Y SUCCESS $N"
    fi
}

for i in $@
do 
   yum list installed $i &>>$LOGFILE
   if [ $? -ne 0 ]
   then
       echo -e "$i is not installed, let's install it!"
   yum install $i -y &>>$LOGFILE
   VALIDATE $? "$i"
   else
       echo -e "$Y $i is already installed $N"

fi

done



