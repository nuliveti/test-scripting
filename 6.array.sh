#!/bin/bash

#### this is called array ...instead of single value it can hold multiple values
FRUITS=("APPLE" "orange" "banana")
###inside the array we always refer values with index and it starts from 0

echo "first fruit :${FRUITS[0]}"
echo "all fruits: ${FRUITS[@]}"