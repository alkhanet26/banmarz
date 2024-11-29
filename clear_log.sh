#!/bin/bash

# Define log directories and files
MARZBAN_LOG_DIR="/var/log/marzban"
NGINX_LOG_DIR="/var/log/nginx"
DOCKER_LOG_DIR="/var/lib/docker/containers"
SYSTEM_LOG_FILES="/var/log/*.log /var/log/syslog /var/log/journal"

# Function to clear logs
clear_logs() {
    local log_path=$1
    if [ -d "$log_path" ]; then
        echo "Clearing logs in directory: $log_path"
        find "$log_path" -type f -name "*.log" -exec truncate -s 0 {} \;
    elif [ -f "$log_path" ]; then
        echo "Clearing log file: $log_path"
        truncate -s 0 "$log_path"
    else
        echo "Path $log_path not found. Skipping."
    fi
}

# Clear Marzban logs
clear_logs "$MARZBAN_LOG_DIR"

# Clear Nginx logs
clear_logs "$NGINX_LOG_DIR"

# Clear Docker container logs (specific to Marzban or all containers)
if [ -d "$DOCKER_LOG_DIR" ]; then
    echo "Clearing Docker container logs..."
    find "$DOCKER_LOG_DIR" -type f -name "*.log" -exec truncate -s 0 {} \;
else
    echo "Docker container logs directory not found. Skipping."
fi

# Clear all system logs
for log_file in $SYSTEM_LOG_FILES; do
    clear_logs "$log_file"
done

echo "All specified logs have been cleared."