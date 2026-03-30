#!/bin/bash
#==================================================================
# Script 4: Log File Analyzer
# Author: Harshit Mathur | Reg No : 24BCE10220
# Course: Open Source Software | VIT Bhopal University
# Purpose: Check disk usage and file permissions
#==================================================================

LOGFILE=${1:-"/tmp/mock_pip.log"}
KEYWORD=${2:-"ERROR"}    # Default keyword is 'error'
COUNT=0

# Adding mock data if no file provided (for testing the run)
if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: Could not satisfy requirement" > "$LOGFILE"
    echo "INFO: Downloading packages" >> "$LOGFILE"
    echo "WARNING: Permissions broken" >> "$LOGFILE"
    echo "ERROR: Version conflict" >> "$LOGFILE"
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"

# TODO: Add a do-while style retry if the file is empty,
# and print the last 5 matching lines using tail + grep

if [ ! -s "$LOGFILE" ]; then
    RETRY=0
    until [ -s "$LOGFILE" ] || [ $RETRY -ge 3 ]; do
        echo "File is currently empty. Retrying read... ($RETRY)"
        sleep 1
        RETRY=$((RETRY + 1))
    done
fi

echo "Last 5 matching lines:"
tail -n 100 "$LOGFILE" 2>/dev/null | grep -i "$KEYWORD" | tail -n 5
