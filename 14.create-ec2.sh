#!/bin/bash

# for creating multiple instances we can use loop and array concepts

NAMES=("mongodb" "redis" "mysql" "rabbitMQ" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
INSTANCE_TYPE=""
IMAGE_ID=ami-03265a0778a880afb
SUCURYTY_GROUP_ID=sg-0a07f1a64bc6c6f12

for i in "${NAMES[@]}"
do
   if [ [$i == "mongodb" || $i == "mysql"] ]
   then
       INSTANCE_TYPE="t3.medium"
   else
       INSTANCE_TYPE="t2.medium"
    fi 
   echo "creating $i instance"
   aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SUCURYTY_GROUP_ID
   --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"
 done  


 ## condition>>> of mysql or mongo db instance_type should be t3.medium, for all other it is t2