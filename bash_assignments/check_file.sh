#!/bin/bash

# file name parameter check
if [ -z "$1" ]; then
    echo "Error: file name to search was not specified"
    echo "Usage: $0 <filename>"
    exit 1
fi

# valid file name check
if [[ "$1" == "." || "$1" == ".." ]]; then
    echo "Error: invalid filename"
    echo "Rule: filename cannot use reserved directory names"
    exit 1
fi

# valid file name check
if [[ ! "$1" =~ ^[[:alnum:]._-]+$ ]]; then
    echo "Error: invalid filename."
    echo "Rule: file name only allows letters, digits, underscore, dot, and hyphen"
    exit 1
fi

# find or create
if [ -f "$1" ]; then 
    echo "File $1 found!"
    size=$(stat -c %s "$1")
    disk_usage=$(du -h "$1" | cut -f1)
    echo "Size: $size bytes. Disk space used: $disk_usage."
else 
    echo "Error: File not found"
    touch "$1"
    echo "File: $1 was created!"
fi

# extra, for practicing: was curious what is the industry standard for implementing a "flag"
if [[ "$2" == "--verbose" || "$2" == "-v" ]]; then
    echo "Permissions:  $(stat -c %A "$1")"
    echo "Owner:  $(stat -c %U "$1")"
fi
