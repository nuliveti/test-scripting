#!/bin/bash

# our goal is to install git 
# first check root user or not 
#if not root user exit programme & inform user to run with sudo accesss
#if root user then install mysql.

USERID=$(id -u)
if [ $USERID -ne 0 ]

then
    echo "ERROR: please run this script as root user"
    exit 1
fi

yum install mysqllll -y

if [ $? -ne 0 ]
then
   echo "mysql has error please check"
   exit 1
else
   echo "mysql successfully installed"

   fi
### its our responsible again to check weather installation success or fail
####EXIT STATUS: by default shell script can't understand the previous status weather successs or failure.
#####so we can append exit status to the script to exit if its fails and proceed to next step if its success