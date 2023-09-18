#!/bin/bash

#set variables
backup_source="/home/cloud_user"
backup_destination="/tmp/cloud_user_backup"
backup_filename="cloud_user_home_$(date +'%Y%m%d%H%M%S').tar.gz"
max_backups=5

# Ensure the backup destination directory exists
sudo mkdir -p "$backup_destination"

# Create a timestamped backup
sudo tar -czf "$backup_destination/$backup_filename" -C "$backup_source" .

# Remove old backups if they exceed the maximum
backup_count=$(ls "$backup_destination" | wc -l)
if [ "$backup_count" -gt "$max_backups" ]; then
          # Sort backups by modification time and remove the oldest
            ls -t "$backup_destination" | tail -n "$((backup_count - max_backups))" | xargs -I {} rm "$backup_destination/{}"
fi

echo "Backup completed: $backup_destination/$backup_filename"
