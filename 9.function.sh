#!/bin/bash
#this script gola is to install mysql
# if its have root then proceed else fail.or exist.
DATE=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/
SCRIPTNAME=
USERID=$(id -u)
##this function should validate previous command and inform user weather success or failure
VALIDATE(){
    #here it will receive the argument1
    if [ $1 -ne 0 ]
then
    echo "$2 ---- FAILURE"
    exit 1
else
    echo "$2 ---- SUCCESS"
fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR: please run with root access"
    exit 1
else
    echo "INFO:: you have root access pls proceed"
fi
## it is our responsibility to check success or not


yum install mysql -y
VALIDATE $?  " MYSQL INSTALLED"
# above we added the argument as $? =$1 and second word we consider as $2

yum install postfix -y

VALIDATE $?  "POSTFIX INSTALLED"


