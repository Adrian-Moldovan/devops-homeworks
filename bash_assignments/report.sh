#!/bin/bash

_OUTPUT_FILE="report.txt"

# task 1: The current user logged in
current_user=$(whoami)
echo "The current user logged in: $current_user" > "$_OUTPUT_FILE"

# task 2: The current working directory
current_working_directory=$(pwd)
echo "The current working directory: $current_working_directory" >> "$_OUTPUT_FILE"

# task 3.1: The last 5 lines of your '.bash_history'
printf "\nThe last 5 lines of the .bash_history file:\n" >> "$_OUTPUT_FILE"
printf "=============================================\n" >> "$_OUTPUT_FILE"

history_file="$HOME/.bash_history"

if [[ -f "$history_file" ]]; then
    tail -n 5 "$history_file" >> "$_OUTPUT_FILE"
else 
    echo "History file not found..." >> "$_OUTPUT_FILE"
fi

# task 3.2: A list of currently running processes
printf "\nA list of currently running processes:\n" >> "$_OUTPUT_FILE"
printf "=============================================\n" >> "$_OUTPUT_FILE"
top -b -n 1 >> "$_OUTPUT_FILE"

# output success message
echo "Report was generated. Output file: $_OUTPUT_FILE"