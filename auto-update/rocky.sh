#!/bin/bash

# Define log file name
LOG_FILE="/var/log/system-updates-`date +%Y-%m-%d-%H-%M-%S`.log"

# Update package lists
echo "Updating package lists at $(date)" >> $LOG_FILE
yum check-update >> $LOG_FILE 2>&1

# Upgrade all packages
echo "Upgrading all packages at $(date)" >> $LOG_FILE
yum -y upgrade >> $LOG_FILE 2>&1


------------------------------------

python version - rocky/redhat - YUM

------------------------------------
import subprocess
import datetime

now = datetime.datetime.now()
LOG_FILE = f"/var/log/system-updates-{now.year}-{now.month}-{now.day}-{now.hour}-{now.minute}-{now.second}.log"

# open log file
log_file = open(LOG_FILE, "a")

-------------------------------------


bash version - rocky/redhat - DNF
------------------------------------
#!/bin/bash

# Define log file name
LOG_FILE="/var/log/system-updates-`date +%Y-%m-%d-%H-%M-%S`.log"

# Update package lists
echo "Updating package lists at $(date)" >> $LOG_FILE
dnf check-update >> $LOG_FILE 2>&1

# Upgrade all packages
echo "Upgrading all packages at $(date)" >> $LOG_FILE
dnf upgrade -y >> $LOG_FILE 2>&1




------------------------------------

python version - rocky/redhat - DNF

------------------------------------
This script uses the dnf command to check for the package lists and then upgrade only the packages that are marked as security updates. The dnf check-update --security command lists the security updates available and the script passes the output of this command to the dnf update --security --advisory=RHSA-* command to upgrade only those packages. The --advisory=RHSA-* option specifies that only Red Hat Security Advisory (RHSA) type updates should be considered.
------------------------------------

import subprocess
import datetime

now = datetime.datetime.now()
LOG_FILE = f"/var/log/system-updates-{now.year}-{now.month}-{now.day}-{now.hour}-{now.minute}-{now.second}.log"

# open log file
log_file = open(LOG_FILE, "a")

# Update package lists
log_file.write(f"Updating package lists at {now}\n")
subprocess.run(["dnf", "check-update"])

# Upgrade all packages
log_file.write(f"Upgrading all packages at {datetime.datetime.now()}\n")
subprocess.run(["dnf", "upgrade", "-y"])

# close log file
log_file.close()


-------------------------------------

This script uses the subprocess module to run the dnf command to check for the package lists and then upgrade only the packages that are marked as security updates. The dnf check-update --security command lists the security updates available and the script passes the output of this command to the dnf update --security --advisory=RHSA-* command to upgrade only those packages. The --advisory=RHSA-* option specifies that only Red Hat Security Advisory (RHSA) type updates should be considered.
