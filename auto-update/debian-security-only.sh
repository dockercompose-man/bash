#!/bin/bash

# Define log file name
LOG_FILE="/var/log/security-updates-`date +%Y-%m-%d-%H-%M-%S`.log"

# Update package lists
echo "Updating package lists at $(date)" >> $LOG_FILE
apt-get update >> $LOG_FILE 2>&1

# Upgrade only security updates
echo "Upgrading security updates at $(date)" >> $LOG_FILE
apt-get -y --only-upgrade install $(apt-mark showauto) >> $LOG_FILE 2>&1
