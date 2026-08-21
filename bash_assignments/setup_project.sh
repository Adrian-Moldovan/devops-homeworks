#!/bin/bash

_GREEN="\033[32m"
_RED="\033[31m"
_RESET="\033[0m"

_SUCCESS_ICON="$_GREEN ✓ $_RESET"
_ERROR_ICON="$_RED ✓ $_RESET"

printf "\n======================\n"
echo "Setup project started."
printf "======================\n\n"

for ((i=1; i<=5; i++)); do
    # create directory
    dir_name="module_$i" 
    if mkdir "module_$i"; then
        printf "${_SUCCESS_ICON} Directory: '$dir_name' created...\n"
    else 
        printf "${_ERROR_ICON} Error creating directory: $dir_name.\n"
        exit 1
    fi

    # create file
    file="module_$i/notes.md"
    if touch "$file"; then
        printf "${_SUCCESS_ICON} File: $file created...\n\n"
    else
        printf "${_ERROR_ICON} Error creating file: $file"
        exit 1
    fi
done

echo "Setup project successfully finished."