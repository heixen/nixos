#!/usr/bin/env bash
# Network interface (replace 'eth0' with your interface, e.g., 'wlan0')
interface="eth0"

# Read received bytes
rx_bytes1=$(cat /sys/class/net/$interface/statistics/rx_bytes 2>/dev/null || echo 0)
sleep 1
rx_bytes2=$(cat /sys/class/net/$interface/statistics/rx_bytes 2>/dev/null || echo 0)

# Calculate download speed (in KB/s)
speed=$(((rx_bytes2 - rx_bytes1) / 1024))

# Cap speed for sparkline scaling (e.g., max 1000 KB/s)
max_speed=1000
if [ $speed -gt $max_speed ]; then
  usage=100
else
  usage=$((100 * speed / max_speed))
fi

# Generate ASCII sparkline
if [ $usage -ge 87 ]; then
  spark="█"
elif [ $usage -ge 75 ]; then
  spark="▇"
elif [ $usage -ge 62 ]; then
  spark="▆"
elif [ $usage -ge 50 ]; then
  spark="▅"
elif [ $usage -ge 37 ]; then
  spark="▄"
elif [ $usage -ge 25 ]; then
  spark="▃"
elif [ $usage -ge 12 ]; then
  spark="▂"
else
  spark="▁"
fi

echo "󰣖 $spark ${speed}KB/s"
