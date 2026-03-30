#!/bin/bash
#==================================================================
# Script 2: FOSS Package Inspector
# Author : Harshit Mathur | Reg No : 24BCE10220
# Course : Open Source Software | VIT Bhopal University
# Purpose: Check if a package is installed and print its details
#==================================================================

PACKAGE="python3"   # e.g. httpd, mysql, vlc, firefox

# Check if package is installed
# Using both rpm and dpkg to ensure cross-distro compatibility on Linux since Python is requested
if bash -c "rpm -q $PACKAGE" &>/dev/null || bash -c "dpkg -s $PACKAGE" &>/dev/null; then
    echo "$PACKAGE is installed."
    # Using rpm if exist, otherwise dpkg fallback
    if command -v rpm &>/dev/null; then
        rpm -qi $PACKAGE | grep -E 'Version|License|Summary'
    else
        dpkg -s $PACKAGE | grep -E 'Version|Maintainer|Description' | head -n 3
    fi
else
    echo "$PACKAGE is NOT installed."
fi

# TODO: Add a case statement that prints a one-line
# philosophy note about the package based on its name
case $PACKAGE in
    httpd)   echo "Apache: the web server that built the open internet" ;;
    mysql)   echo "MySQL: open source at the heart of millions of apps" ;;
    # TODO: Add your software and 3 others
    python3) echo "Python: Simple is better than complex; Readability counts." ;;
    vlc)     echo "VLC: Open source traffic cone that plays absolutely everything." ;;
    firefox) echo "Firefox: Dedicated to internet health and open web standards." ;;
    docker)  echo "Docker: Build, Ship, and Run Any App, Anywhere." ;;
    *)       echo "Unknown software package philosophy." ;;
esac
