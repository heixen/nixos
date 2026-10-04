#!/usr/bin/env bash

# CPU usage
read -r _ user nice system idle iowait irq softirq steal _ < /proc/stat
total1=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle1=$((idle + iowait))

sleep 0.2

read -r _ user nice system idle iowait irq softirq steal _ < /proc/stat
total2=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle2=$((idle + iowait))

total_diff=$((total2 - total1))
idle_diff=$((idle2 - idle1))

cpu=$((100 * (total_diff - idle_diff) / total_diff))

# RAM used
mem=$(free -h | awk '/^Mem:/ {print $3}')

# Disk used on /
disk=$(df -h / | awk 'NR==2 {print $3}')

printf " %d  %s  %s\n" "$cpu" "$mem" "$disk"

