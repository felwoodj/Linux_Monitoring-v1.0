#!/bin/bash

. color.sh

#color code
color_code_1="${color_nums[$1]}"
color_code_2="${color_nums[$2]}"
color_code_3="${color_nums[$3]}"
color_code_4="${color_nums[$4]}"

#colors
colors_1="${colors_background[$color_code_1]}"
colors_2="${colors_font[$color_code_2]}"
colors_3="${colors_background[$color_code_3]}"
colors_4="${colors_font[$color_code_4]}"

# value names color
vlnc="\033[${colors_1};${colors_2};1m"
vlc="\033[${colors_3};${colors_4};1m"


echo ""
echo -e "${vlnc}HOSTNAME = ${vlc}$HOSTNAME\e[0m"
echo -e "${vlnc}TIMEZONE = ${vlc}$(timedatectl show --property=Timezone --value) UTC $(date +%z)\e[0m"
echo -e "${vlnc}USER = ${vlc}$(whoami)\e[0m"
echo -e "${vlnc}OS=${vlc}$(lsb_release -d | awk '{print $2, $3, $4, $5}')\e[0m"
echo -e "${vlnc}DATE=${vlc}$(date "+%d %b %Y %T")\e[0m"
echo -e "${vlnc}UPTIME = ${vlc}$(uptime -p)\e[0m"
echo -e "${vlnc}UPTIME_SEC = ${vlc}$(cat /proc/uptime | awk '{print $1}')\e[0m"
echo -e "${vlnc}IP = ${vlc}$(ip route get 8.8.8.8 | awk '{print $7}')\e[0m"
echo -e "${vlnc}MASK = ${vlc}$(ifconfig | grep -A 1 "eth0" | tail -1 | awk '{print $4}')\e[0m"
echo -e "${vlnc}GATEWAY = ${vlc}$(ip r | grep default | awk '{print $3}')\e[0m"
echo -e "${vlnc}RAM_TOTAL = ${vlc}$(free -h | grep Mem | awk '{print $2}')\e[0m"
echo -e "${vlnc}RAM_USED = ${vlc}$(free -h | grep Mem | awk '{print $3}')\e[0m"
echo -e "${vlnc}RAM_FREE = ${vlc}$(free -h | grep Mem | awk '{print $4}')\e[0m"
echo -e "${vlnc}SPACE_ROOT = ${vlc}$(df -h / | awk '{print $2}' | tail -1)\e[0m"
echo -e "${vlnc}SPACE_ROOT_USED = ${vlc}$(df -h / | awk '{print $3}' | tail -1)\e[0m"
echo -e "${vlnc}SPACE_ROOT_FREE = ${vlc}$(df -h / | awk '{print $4}' | tail -1)\e[0m"
echo ""
