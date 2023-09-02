#!/bin/bash

# our goal is to install git 
# first check root user or not 
#if not root user exit programme & inform user to run with sudo accesss
#if root user then install mysql.

USERID=$(id -u)
if [ $USERID -ne 0 ]

then
    echo "ERROR: please run this script as root user"
fi

yum install git -y