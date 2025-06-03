#!/bin/bash

echo "Killing all ROS 2 nodes..."

PIDS=$(ps aux | grep -E "ros2|gazebo|gzserver|gzclient" | grep -v grep | awk '{print $2}')

if [ -z "$PIDS" ]; then
    echo "No ROS 2 nodes or Gazebo processes running."
else
    echo "Killing the following PIDs:"
    echo "$PIDS"
    kill -9 $PIDS
    echo "All ROS 2 related processes killed."
fi