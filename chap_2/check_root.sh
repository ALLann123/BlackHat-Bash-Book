#!/usr/bin/env bash

#checks if the current user ID equals zero
#create a function that checks if the user is root
check_ifroot(){
	if [[ "${EUID}" -eq "0" ]]; then
		return 0
	else
		return 1;
	fi
}

#if the above function  returns 0 it evaluates to true and if it returns 1 it evaluates to false

if check_ifroot; then
	echo "[+]The user is Root"
else
	echo "[-]The user is not root"
fi
