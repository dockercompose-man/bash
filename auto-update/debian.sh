#!/bin/bash

# Define log file name
LOG_FILE="/var/log/system-updates-`date +%Y-%m-%d-%H-%M-%S`.log"

# Update package lists
echo "Updating package lists at $(date)" >> $LOG_FILE
apt-get update >> $LOG_FILE 2>&1

# Upgrade all packages
echo "Upgrading all packages at $(date)" >> $LOG_FILE
apt-get -y upgrade >> $LOG_FILE 2>&1
