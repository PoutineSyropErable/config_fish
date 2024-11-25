#!/bin/bash

############### DO NOT USE ######################
#Some script currently relies on fish aliases. Todo Later!

# Check if a file is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Input file
input_file="$1"

# Check if the file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

# Create a temporary file for output
temp_file=$(mktemp)

# Read the file line by line
while IFS= read -r line; do
    # Match lines with Fish alias syntax: alias name="command"
    if [[ "$line" =~ alias[[:space:]]+([a-zA-Z0-9_-]+)=\"(.*)\" ]]; then
        alias_name="${BASH_REMATCH[1]}"
        alias_command="${BASH_REMATCH[2]}"
        
        # Replace alias with abbr
        echo "abbr $alias_name \"$alias_command\"" >> "$temp_file"
    else
        # Keep non-alias lines unchanged
        echo "$line" >> "$temp_file"
    fi
done < "$input_file"

# Replace the original file with the updated content
mv "$temp_file" "$input_file"

echo "Replaced all aliases with abbr in '$input_file'."

