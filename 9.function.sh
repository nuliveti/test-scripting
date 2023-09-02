#!/bin/bash

# function:
# you will keep some code inside functions which is more often repeated, and call whenever you require

# function will do some work on behalf of us and it will update what happend

### we need to give inputs to the function and function will give us output.


USERID=$(id -u)
VALIDATE(){
    
}
# this function should validate the previous command nd inform user it is success or failure.
if [ $1 -ne 0 ]
then
   echo "installation ........FAILURE"
   exit 1
else
   echo "installation .......SUCCESS"

   fi

if [ $USERID -ne 0 ]

then
    echo "ERROR: please run this script as root user"
   
fi
### its our responsible again to check weather installation success or fail
yum install mysql -y
VALIDATE $?

   yum install postfix -y

VALIDATE $?