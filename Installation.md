---- Docker Intro -----
Commands
docker image ls
docker container ls
docker run
docker ps
docker exec -it <container_id> /bin/bash
docker stop <container_id>
docker rm <container_id>

#ROS2 Humble Setup
docker pull ros:humble-ros-core
docker run -it --rm --name ros-humble-container -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ros:humble-ros-core

#ROS2 Humble Setup with VNC
docker run -it --rm --name ros-humble-container-vnc -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -p 5900:5900 ros:humble-ros-core   



----- NOT USING THIS -----
Install VMWare Fusion 13 on your Mac
https://www.techspot.com/downloads/downloadnow/2755/?evp=b9879fcc0383c08cef26189e2277a4ec&file=11022

When selecting the OS, ensure Ubuntu 64-bit is selected, NOT Ubuntu.
