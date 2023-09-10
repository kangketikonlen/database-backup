#!/bin/bash

# Directory where backups are stored
backup_dir="/backup"

# Generate a backup file name with the current date and time
backup_file="$backup_dir/backup-$(date +\%Y\%m\%d\%H\%M\%S).sql"

# Perform the database backup and save it to the generated file
mysqldump -hdatabase-mariadb -u${MYSQL_USER} -p${MYSQL_PASSWORD} --all-databases >"$backup_file"

# Clean up old backup files (older than 7 days)
find "$backup_dir" -type f -mtime +7 -exec rm {} \;
