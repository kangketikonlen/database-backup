FROM mariadb:11.1.2

# Install cron
RUN apt-get update && apt-get -y install cron mysql-client

# Copy backup script into the container
COPY backup.sh /backup.sh

# Copy the create-crontab.sh script into the container
COPY create-crontab.sh /create-crontab.sh

# Make the script executable
RUN chmod +x /create-crontab.sh
RUN chmod +x /backup.sh

# Start cron service and execute the create-crontab script
CMD ["/create-crontab.sh"]
