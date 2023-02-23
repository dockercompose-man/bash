#!/bin/bash

# Define log file name
LOG_FILE="/var/log/security-updates-`date +%Y-%m-%d-%H-%M-%S`.log"

# Update package lists
echo "Updating package lists at $(date)" >> $LOG_FILE
yum updateinfo >> $LOG_FILE 2>&1

# Upgrade only security updates
echo "Upgrading security updates at $(date)" >> $LOG_FILE
yum --security update >> $LOG_FILE 2>&1

------------------------------------

python version - rocky/redhat - YUM

------------------------------------
import subprocess
import datetime

now = datetime.datetime.now()
LOG_FILE = f"/var/log/security-updates-{now.year}-{now.month}-{now.day}-{now.hour}-{now.minute}-{now.second}.log"

# open log file
log_file = open(LOG_FILE, "a")

# Update package lists
log_file.write(f"Updating package lists at {now}\n")
subprocess.run(["yum", "updateinfo"])

# Upgrade only security updates
log_file.write(f"Upgrading security updates at {datetime.datetime.now()}\n")
subprocess.run(["yum", "--security", "update"])

# close log file
log_file.close()

-------------------------------------


bash version - rocky/redhat - DNF
------------------------------------
#!/bin/bash

# Define log file name
LOG_FILE="/var/log/security-updates-`date +%Y-%m-%d-%H-%M-%S`.log"

# Update package lists
echo "Updating package lists at $(date)" >> $LOG_FILE
dnf check-update --security >> $LOG_FILE 2>&1

# Upgrade only security updates
echo "Upgrading security updates at $(date)" >> $LOG_FILE
dnf update --security --advisory=RHSA-* >> $LOG_FILE 2>&1



------------------------------------

python version - rocky/redhat - DNF

------------------------------------
This script uses the dnf command to check for the package lists and then upgrade only the packages that are marked as security updates. The dnf check-update --security command lists the security updates available and the script passes the output of this command to the dnf update --security --advisory=RHSA-* command to upgrade only those packages. The --advisory=RHSA-* option specifies that only Red Hat Security Advisory (RHSA) type updates should be considered.
------------------------------------

import subprocess
import datetime

now = datetime.datetime.now()
LOG_FILE = f"/var/log/security-updates-{now.year}-{now.month}-{now.day}-{now.hour}-{now.minute}-{now.second}.log"

# open log file
log_file = open(LOG_FILE, "a")

# Update package lists
log_file.write(f"Updating package lists at {now}\n")
subprocess.run(["dnf", "check-update", "--security"])

# Upgrade only security updates
log_file.write(f"Upgrading security updates at {datetime.datetime.now()}\n")
subprocess.run(["dnf", "update", "--security", "--advisory=RHSA-*"])

# close log file
log_file.close()

-------------------------------------

This script uses the subprocess module to run the dnf command to check for the package lists and then upgrade only the packages that are marked as security updates. The dnf check-update --security command lists the security updates available and the script passes the output of this command to the dnf update --security --advisory=RHSA-* command to upgrade only those packages. The --advisory=RHSA-* option specifies that only Red Hat Security Advisory (RHSA) type updates should be considered.
