#!/bin/bash

# Create .auditignore with regex patterns if it doesn't exist
if [ ! -f .auditignore ]; then
    cat << 'EOF' > .auditignore
^\./\.git(/|$)
^\./doc(/|$)
^\./\.github(/|$)
^\./\.devcontainer(/|$)
(/|^)build/
\.bin$
\.so$
\.dll$
\.exe$
\.pyc$
\.png$
\.md$
\.ttf$
^\./\.audit
EOF
fi

# Create initial file list using grep -E for regex ignore patterns
if [ ! -f .auditfiles ]; then
    find . -type f | grep -vE -f .auditignore > .auditfiles
fi

# Rest remains the same
[ -f .auditfilesdone ] || touch .auditfilesdone

if [ ! -f .auditissues.csv ]; then
    echo "filename,line number,code snippet,description" > .auditissues.csv
fi
