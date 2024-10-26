# Use an ARM64 Ubuntu base image compatible with Mac M1
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Replace default Ubuntu mirrors with ARM64 optimized mirrors
RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://ports.ubuntu.com/ubuntu-ports/|g' /etc/apt/sources.list

# Force apt-get to use IPv4 (optional)
RUN echo 'Acquire::ForceIPv4 "true";' > /etc/apt/apt.conf.d/99force-ipv4

# Set timezone and locale configurations to suppress prompts
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Update and install necessary packages with retries and timeouts
RUN apt-get update -o Acquire::Retries=5 -o Acquire::http::Timeout="60" && \
    apt-get install -y --no-install-recommends \
    tzdata \
    locales \
    wget \
    curl \
    gnupg2 \
    lsb-release \
    software-properties-common \
    build-essential \
    git \
    vim \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    xvfb \
    dbus-x11 \
    xterm \
    xorg \
    x11-xserver-utils

# Configure locales
RUN locale-gen en_US en_US.UTF-8
ENV LANG=en_US.UTF-8

# Add ROS2 apt repository
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | \
    gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=arm64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > \
    /etc/apt/sources.list.d/ros2-latest.list

# Update and install ROS2 Humble
RUN apt-get update -o Acquire::Retries=5 -o Acquire::http::Timeout="60" && \
    apt-get install -y --no-install-recommends ros-humble-desktop

# Add the Open Robotics PPA for Gazebo 11 on ARM64
RUN add-apt-repository ppa:openrobotics/gazebo11-non-amd64 && \
    apt-get update -o Acquire::Retries=5 -o Acquire::http::Timeout="60"

# Install Gazebo 11
RUN apt-get install -y --no-install-recommends gazebo

# Clean up apt cache to reduce image size
RUN rm -rf /var/lib/apt/lists/*

# Source ROS2 setup script
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Set up VNC server password
RUN mkdir -p ~/.vnc && \
    x11vnc -storepasswd 1234 ~/.vnc/passwd

# Expose VNC port
EXPOSE 5900

# Copy start script
COPY start_vnc.sh /usr/local/bin/start_vnc.sh
RUN chmod +x /usr/local/bin/start_vnc.sh

# Set default command
CMD ["/usr/local/bin/start_vnc.sh"]
