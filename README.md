## Robot ROS2 Package Template
 test
Goal here is to create a fairly low-cost mobile robot, that can:

Be remote controlled from a phone, with camera feedback (teleoperation)
Use lidar and SLAM to generate a map of a room and navigate autonomously
Use a camera with OpenCV to detect objects and follow them

A major inspiration for this project is Josh Newans (Articulated Robotics) tutorials on building a mobile robot from scratch. I learned a lot from his tutorials and highly recommend them. Without Josh's tutorials, this project would not be possible and I would not have learned ROS2 and Gazebo as much as I have.


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


Setting up your development environment & Docker instructions

RUNNING THE CONTAINER
    docker run -it --rm --name ros2_gui_container -p 5900:5900 -v $HOME/ros2:/root/ros2 ros2_gui

Connect to the container & getting a bash shell
    docker exec -it ros2_gui_container /bin/bash

# Running VNC server on your MAC 
download tigerVNCViewer and install it on your MAC
Open the VNC Viewer and connect to localhost:5900
Open xterm on the VNC Viewer and you should see the ROS2 environment ready
You can now run your ros2 commands on the container, rviz, gazebo, etc.
Your development environment should be mounted on the container.

** Getting your mobile-bot simulation running **
1. Pre-requisites:
    - You connected to the container using the instructions above
    - TigerVNCViewer is running and connected to the container
    - Open a terminal on the VNC Viewer
2. Running some basic ros2 commands (cd ~/ros2/ros2-ws/)
    - ros2 topic list
3. Launching the simulation
    - ros2 launch my_mobile_ros_bot rsp.launch.py use_sim_time:=true
    - rviz2 -d ./config/view_bot.rviz 
    - If you don't see the wheels on the bot then run in another terminal:
        - ros2 run joint_state_publisher_gui joint_state_publisher_gui
    - Starting Gazebo
        - check sim_time parameter
        - ros2 param get /robot_state_publisher use_sim_time
        - if it is not true, then run:
            - ros2 param set /robot_state_publisher use_sim_time true
        - Launch Gazebo:
            - ros2 run ros_gz_sim create -topic robot_description -name bot_name
            - ros2 launch ros_ign_gazebo ign_gazebo.launch.py
        - Spawn our robot using the spawn script
            ros2 run ros_gz_sim create -topic robot_description -name bot_name


-- Detached container
1. docker run -d --name ros2_gui_container -v $HOME/ros2:/root/ros2 -p 5900:5900 ros2_gui
2. Once the container is running:
    docker exec -it ros2_gui_container /bin/bash
3. 


BUILDING THE CONTAINER
docker build --progress=plain -t ros2_gui . 
docker build --no-cache --progress=plain -t ros2_gui . 
docker run -it --rm --name ros2_gui_container -p 5900:5900 ros2_gui


Mount the workspace from the host machine to the container
docker run -it --rm --name ros2_gui_container -p 5900:5900 -v /Users/jose/ros2_ws:/root/ros2_ws ros2_gui



--- GAZEBO STEPS ---

sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
sudo wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt-get update && \
sudo apt-get install -y lsb-release wget gnupg && \
sudo apt-get install -y gz-garden && \
sudo apt-get install -y libignition-transport11-dev && \
sudo apt-get install -y libignition-gazebo6-dev && \
sudo apt-get install -y libgflags-dev