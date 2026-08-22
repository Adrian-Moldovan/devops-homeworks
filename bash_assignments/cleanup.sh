#!/bin/bash

echo "=================="
echo "Running cleanup.sh"
echo "=================="

# folder name parameter check
if [[ -z "$1" ]]; then
    echo "Error: folder name to cleanup was not specified"
    echo "Usage: $0 <folder>"
    exit 1
fi

# check folder existance
if [[ ! -d "$1" ]]; then
    echo "Error: folder '$1' does not exist"
    exit 1 
fi

# counting the tmp files in the folder
tmp_files_count=$(find "$1" -maxdepth 1 -type f -name "*.tmp" | wc -l)

# if no files found, stop
if [[ tmp_files_count -eq 0 ]]; then 
    echo "Folder found, but no .tmp files found, exiting script"
    exit 0
fi

# confirm deletion
read -p "Folder found, $tmp_files_count .tmp files to delete. Are you sure? [y/n]: " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Cancelled, exiting script... "
    exit 0 
fi

# deleting files
count=0
for file in "$1"/*.tmp; do
    printf "%d. Deleting: %s" "$((++count))" "$file"
    if rm "$file"; then 
        printf " [OK]\n"
    else 
        printf " [Failed]\n"
    fi
done