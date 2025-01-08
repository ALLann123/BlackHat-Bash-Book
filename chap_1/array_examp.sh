#!/usr/bin/env bash

#create an array and add no (,) between the elements of the array

#sets array
IP_Address=(192.168.1.1 192.168.1.137 192.168.1.198)

#print all elements of the arrays
echo "${IP_Address[*]}"
echo "----------------------------"
#print the first element of the array
echo "${IP_Address[0]}"

#we can delete elements of an array using unset
unset IP_Address[1]
echo "----------------------------"
echo "${IP_Address[*]}"
