#!/bin/bash

# for creating multiple instances we can use loop and array concepts

NAMES=("mongodb" "redis" "mysql" "rabbitMQ" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")


for i in "${NAMES[@]}"
do
   echo "NAME: $i"
 done  