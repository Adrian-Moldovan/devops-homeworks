#!/bin/bash

# check that name is provided
if [ -z "$1" ]; then
    echo "Error: name was not specified"
    echo "Usage: $0 <name>"
    exit 1
fi

echo "Hello $1! Today is $(date +"%d.%m.%Y")"