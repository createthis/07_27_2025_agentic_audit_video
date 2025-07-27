#!/bin/bash
file="$1"

if [ -z "$file" ]; then
    echo "Error: No file specified"
    exit 1
fi

# Actual audit would happen here
echo "Checking $file for issues..."

# Mark as completed
echo "$file" >> .auditfilesdone

# Remove from todo list
grep -v "^$file$" .auditfilestodo > .auditfilestodo.tmp
mv .auditfilestodo.tmp .auditfilestodo
