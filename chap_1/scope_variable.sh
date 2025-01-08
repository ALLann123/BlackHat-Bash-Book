#!/usr/bin/env bash

team="Pwn to own"      #this is a global variable can be accessed anywhere inthe program

print_name(){
	#this is a function
	local name        #declare the variable to be local to the function
	name="Own_the_net"

	echo "The leader of the crew ${team} has been identified as ${name}"
}

print_name

#when we call the local variable name it can not be called outside the function

echo "The arreseted hacker goes by the name ${name}"

