#!/bin/bash

# Create a crontab file with your desired schedule
echo "0 0 * * * /bin/bash /backup.sh" >/etc/cron.d/backup-cron

# Make the crontab file readable
chmod 0644 /etc/cron.d/backup-cron

# Start cron service
cron -f
