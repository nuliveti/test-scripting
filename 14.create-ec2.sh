#!/bin/bash

# for creating multiple instances we can use loop and array concepts

NAMES=("mongodb" "redis" "mysql" "rabbitMQ" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
INSTANCE_TYPE=""
IMAGE_ID=ami-03265a0778a880afb
SUCURYTY_GROUP_ID=sg-0a07f1a64bc6c6f12
DOMAIN_NAME=kirandevops.online

for i in "${NAMES[@]}"
do
   if [[$i == "mongodb" || $i == "mysql"]]
   then
       INSTANCE_TYPE="t3.medium"
   else
       INSTANCE_TYPE="t2.medium"
    fi 
   echo "creating $i instance"
   IP_ADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SUCURYTY_GROUP_ID
   --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].
   privateIpAddress')
   echo "created $i instancec: $IP_ADDRESS"
   aws route53 change-resource-record-sets --hosted-zone-id Z02149642661K5V8NCK02 --change-batch '
{
          
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                                    "Name": "$i.$'$i.$DOMAIN_NAME'",
                                    "Type": "A",
                                    "TTL": 300,
                                 "ResourceRecords": [{ "Value": "'$IP_ADDRESS'"}]
                                 }}]
}
'
 done  


 ## condition>>> of mysql or mongo db instance_type should be t3.medium, for all other it is t2