#!/usr/bin/env bash

#check whether a file exists and is greater than zero

echo "Leave me here!!" > robot.txt

if [[ -f "robot.txt" && -s "robot.txt" ]]; then
	echo "[+]FIle exists and is greater than zero"
fi
