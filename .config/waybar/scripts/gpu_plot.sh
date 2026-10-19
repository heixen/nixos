#!/usr/bin/env bash
# Check if intel_gpu_top is available
if ! command -v intel_gpu_top &>/dev/null; then
  echo "⚠ intel_gpu_top not found"
  exit 1
fi

# Run intel_gpu_top in batch mode and extract render engine usage
usage=$(intel_gpu_top -J -s 100 | jq -r '.engines["Render/3D/0"].busy' | head -n 1)

# Handle null or invalid output
if [ -z "$usage" ] || [ "$usage" = "null" ]; then
  usage=0
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

echo "󰢮 $spark $usage%"
