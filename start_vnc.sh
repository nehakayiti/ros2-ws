#!/bin/bash

export DISPLAY=:1

# Start XVFB with the desired screen resolution
Xvfb :1 -screen 0 1280x800x24 &

# Wait for XVFB to start
sleep 2

# Start XFCE desktop session
startxfce4 &

# Wait for desktop to start
sleep 2

# Start VNC server
x11vnc -display :1 -forever -shared -rfbport 5900 -nopw -xkb&

# Keep the container running and provide a shell
exec /bin/bash
