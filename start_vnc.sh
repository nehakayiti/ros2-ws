#!/bin/bash

export DISPLAY=:1

# Start virtual framebuffer
Xvfb :1 -screen 0 1280x800x24 &

# Wait for Xvfb to start
sleep 3

# Start XFCE desktop session
startxfce4 &

# Wait for desktop to start
sleep 3

# Start VNC server
x11vnc -display :1 -rfbauth ~/.vnc/passwd -forever -shared &

# Keep the container running
tail -f /dev/null
