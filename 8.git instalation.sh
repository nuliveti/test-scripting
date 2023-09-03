#!/bin/bash
#this script gola is to install mysql
# if its have root then proceed else fail.or exist.

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "error: please run with root access"
    exit 1
else
    echo "INFO: ur root user"
fi
## it is our responsibility to check success or not
yum install git -y

if [ $? -ne 0 ]
then
    echo "Installation of MYSQL SUCCESS"
    exit 1
else
    echo "Installation of MYSQL FAILURE"
fi