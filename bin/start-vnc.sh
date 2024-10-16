#!/bin/bash

# Set the display number
export DISPLAY=:1

# Create VNC session directory if needed
mkdir -p /root/.vnc

# Start the VNC server
Xvnc :1 -geometry 1280x720 -depth 24 -rfbauth /root/.vnc/passwd &

# Start i3 after a short delay to ensure Xvnc is running
sleep 2

# Start i3
exec i3