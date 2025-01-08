#!/usr/bin/env bash

#create an empty file 

file_name="robot.txt"

touch "${file_name}"

#now lets continue checking if file size is greater than zero

until [[ -s "${file_name}" ]]; do
	echo "[-]FIle is empty!!"
	echo "Starting in 2 secs...."
	sleep 2
done

echo "[+]File is not empty!!"
