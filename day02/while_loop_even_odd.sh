#!/bin/bash

num=0
while [[ $num -le 10 && $((num % 2))==0 ]]
do
    echo "$num is even number"
    num=$((num+1))
done
