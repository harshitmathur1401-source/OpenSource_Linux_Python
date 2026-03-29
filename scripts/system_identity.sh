#!/bin/bash
# Script 1: System Identity Report
# Author: Student Analyst | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="Student Analyst"       # Fill in your name
SOFTWARE_CHOICE="Python"             # Fill in your chosen software

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p 2>/dev/null || echo "Unknown")

# --- Display ---
echo "  Open Source Audit - $STUDENT_NAME"
echo "Kernel  : $KERNEL"
echo "User    : $USER_NAME"
echo "Uptime  : $UPTIME"

# TODO: Add distro name, date, and license message

# Distro name
if [ -f /etc/os-release ]; then
    DISTRO=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d'"' -f2)
else
    DISTRO=$(uname -o 2>/dev/null || echo "Unknown")
fi
echo "Distro  : $DISTRO"

# Date
echo "Date    : $(date)"

# License message
echo "License : The Python Software Foundation (PSF) License is highly permissive."
