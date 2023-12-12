#!/bin/bash

function print_sys {

echo ""
echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $(timedatectl show --property=Timezone --value) UTC $(date +%z)"
echo "USER = $(whoami)"
echo "OS=$(lsb_release -d | awk '{print $2, $3, $4, $5}')"
echo "DATE=$(date "+%d %b %Y %T")"
echo "UPTIME = $(uptime -p)"
echo "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')"
echo "IP = $(ip route get 8.8.8.8 | awk '{print $7}')"
echo "MASK = $(ifconfig | grep -A 1 "eth0" | tail -1 | awk '{print $4}')"
echo "GATEWAY = $(ip rpute | grep default | awk '{print $3}')"
echo "RAM_TOTAL = $(free -h | grep Mem | awk '{print $2}')"
echo "RAM_USED = $(free -h | grep Mem | awk '{print $3}')"
echo "RAM_FREE = $(free -h | grep Mem | awk '{print $4}')"
echo "SPACE_ROOT = $(df -h / | awk '{print $2}' | tail -1)"
echo "SPACE_ROOT_USED = $(df -h / | awk '{print $3}' | tail -1)"
echo "SPACE_ROOT_FREE = $(df -h / | awk '{print $4}' | tail -1)"
echo ""

}
