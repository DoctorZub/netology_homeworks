#!/bin/bash

CreateBackup() {
rsync -a --delete /home/docz /tmp/backup
if [[ $? -eq 0 ]]; then
	echo "backup was completed successfully" >> /var/log/syslog
else
	echo "ERROR! During the backup, an error occurred!" >> /var/log/syslog

fi
}

CreateBackup

