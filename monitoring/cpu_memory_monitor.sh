#!/bin/bash

# Initialize CSV file
output_file="system_usage.csv"
echo "Timestamp,CPU,Memory" > $output_file

function finish {
  echo "Exiting. Data has been saved to ${output_file}."
  exit
}

trap finish SIGINT

while true; do
  timestamp=$(date "+%Y-%m-%d %H:%M:%S")

  # Get CPU and memory usage using top command
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  mem_usage=$(top -bn1 | grep "MiB Mem" | awk '{print $8/$4 * 100}')

  echo "$timestamp,$cpu_usage,$mem_usage" >> $output_file

  # Gather data every second
  sleep 1
done
