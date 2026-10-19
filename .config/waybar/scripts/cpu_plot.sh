#!/usr/bin/env bash
# Read CPU stats
cpu_stat1=($(cat /proc/stat | grep '^cpu '))
sleep 0.1
cpu_stat2=($(cat /proc/stat | grep '^cpu '))

# Calculate total and idle times
total1=$((cpu_stat1[1] + cpu_stat1[2] + cpu_stat1[3] + cpu_stat1[4] + cpu_stat1[5] + cpu_stat1[6] + cpu_stat1[7]))
idle1=$((cpu_stat1[4] + cpu_stat1[5]))
total2=$((cpu_stat2[1] + cpu_stat2[2] + cpu_stat2[3] + cpu_stat2[4] + cpu_stat2[5] + cpu_stat2[6] + cpu_stat2[7]))
idle2=$((cpu_stat2[4] + cpu_stat2[5]))

# Compute usage percentage
diff_total=$((total2 - total1))
diff_idle=$((idle2 - idle1))
usage=$((100 * (diff_total - diff_idle) / diff_total))

# Generate ASCII sparkline (8 levels: ▁▂▃▄▅▆▇█)
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

echo " $spark $usage%"
