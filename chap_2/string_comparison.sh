#!/usr/bin/env bash

stud_name_one="Allan"
stud_name_two="Kamau"

if [[ "${stud_name_one}" == "${stud_name_two}" ]]; then
	echo "They are equal"
else
	echo "They are not equal"
fi
