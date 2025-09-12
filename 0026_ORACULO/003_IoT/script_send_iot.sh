#!/bin/bash

# This script is designed to run the lm35 sensor script continuously.
# It will keep the Python script running in a loop, automatically
# restarting it if it ever stops for any reason.
# Make sure you are in the directory where the 'send_to_iot.py' file is located.
while true
do
echo "Starting send_to_iot.py..."
# The 'python3' command executes the Python script.
python3 send_to_iot.py
# If the script above exits, this message will be printed.
echo "Script stopped. Restarting in 10 seconds..."
sleep 10
done