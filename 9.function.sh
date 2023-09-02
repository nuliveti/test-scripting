#!/bin/bash

# function:
# you will keep some code inside functions which is more often repeated, and call whenever you require

# function will do some work on behalf of us and it will update what happend

### we need to give inputs to the function and function will give us output.


USERID=$(id -u)
# this function should validate the previous command nd inform user it is success or failure.

VALIDATE(){
 #$1----it will receive the argument
if [ $1 -ne 0 ]
then
   echo "$2 ........FAILURE"
   exit 1
else
   echo "$2 .......SUCCESS"

   fi
}
if [ $USERID -ne 0 ]

then
    echo "ERROR: please run this script as root user"
   exit 1
fi
### its our responsible again to check weather installation success or fail
yum install mysql -y
VALIDATE $? "installing MYSQL"

   yum install postfix -y

VALIDATE $? "installing postfix"