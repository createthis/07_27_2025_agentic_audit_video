#!/bin/bash

# Get percentage complete
total=$(wc -l < .auditfiles)
done=$(wc -l < .auditfilesdone)
percent=$((done*100/total))

# Get next file
grep -v -F -f .auditfilesdone .auditfiles > .auditfilestodo

next=$(head -n 1 .auditfilestodo)

if [ -z "$next" ]; then
    echo "100% complete! No more files to audit."
else
    echo "$percent% complete. Next file: $next"
fi
