#!/bin/bash

output_file="top5_usage.csv"
echo "Timestamp,Process,CPU(%),Memory(%)" > $output_file

# Function to save results to CSV on exit
function finish {
  echo "Exiting. Data has been saved to ${output_file}."
  exit
}

trap finish SIGINT

while true; do
  timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  top -b -o +%CPU -n 1 | head -n 12 | tail -n 5 | while read -r line; do
    process=$(echo $line | awk '{print $12}')
    cpu_usage=$(echo $line | awk '{print $9}')
    mem_usage=$(echo $line | awk '{print $10}') 

    echo "$timestamp,$process,$cpu_usage,$mem_usage" >> $output_file
  done

  sleep 1
done
