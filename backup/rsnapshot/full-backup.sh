#!/bin/bash

# Define log file name
LOG_FILE="/var/log/backup-`date +%Y-%m-%d-%H-%M-%S`.log"

# Define the exclude pattern
EXCLUDE_PATTERN="--exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/lost+found --exclude=/swapfile"

# Take a snapshot of the system
echo "Taking snapshot at $(date)" >> $LOG_FILE
rsnapshot -c /etc/rsnapshot.conf hourly $EXCLUDE_PATTERN >> $LOG_FILE 2>&1
