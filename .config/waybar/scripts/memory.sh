#!/usr/bin/env bash

# Get memory stats
mem_total=$(free -m | awk '/^Mem:/ {print $2}')
mem_used=$(free -m | awk '/^Mem:/ {print $3}')
usage=$((100 * mem_used / mem_total))

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

echo " $spark $usage%"
