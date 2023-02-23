#!/bin/bash

# Define log file name
LOG_FILE="/var/log/security-updates-`date +%Y-%m-%d-%H-%M-%S`.log"

# Update package lists
echo "Updating package lists at $(date)" >> $LOG_FILE
yum updateinfo >> $LOG_FILE 2>&1

# Upgrade only security updates
echo "Upgrading security updates at $(date)" >> $LOG_FILE
yum --security update >> $LOG_FILE 2>&1
