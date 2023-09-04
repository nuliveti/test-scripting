#!/bin/bash


# echo 1
# echo 2
# echo 3
# echo 4


##below is the example for 100 and we can change it any time as per requirement

# for i in {1..100}
# do
#   echo $i
# done  

#all argumants are in $@

for i in $@
do 
   yum install $i -y
   done

# A. improvements
# b. implement log files
# implement colours
# implement validaTIONS
# implement validations through functions
# your script should check package already installed or not, if already installed print yellow colour
# if installed just print package already installed, it should not run install command.
