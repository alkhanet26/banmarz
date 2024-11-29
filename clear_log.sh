#!/bin/sh

# Define log directories and files
MARZBAN_LOG_FILE="/var/lib/marzban/*.log"
NGINX_LOG_FILE="/var/log/nginx/*.log"

# Clear Marzban logs
echo "CLearing Marzban Log"
rm -r $MARZBAN_LOG_FILE

# Clear Nginx logs
echo "CLearing NGINX Log"
rm -r $NGINX_LOG_FILE

echo "All specified logs have been cleared."
