#!/bin/bash -e

# Reference sites
# https://www.stereolabs.com/blog/ros-and-nvidia-jetson-nano/

echo "[Add the ROS repository]"
if [ ! -e /etc/apt/sources.list.d/ros-latest.list ]; then
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
fi
#sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

echo "[Update the package]"
sudo apt-get update

echo "[Installing ROS and ROS Packages]"
sudo apt-get install -y ros-melodic-desktop

echo "[Making the catkin workspace and testing the catkin build]"
#sudo apt-get install -y cmake python-rosinstall python-catkin-tools
sudo apt-get install -y python-catkin-tools
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
source /opt/ros/melodic/setup.bash
catkin init
catkin build
sh -c "echo \"source ~/catkin_ws/devel/setup.bash\" >> ~/.bashrc"
source ~/.bashrc

echo "[Dependecies for building packages]"
sudo apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator build-essential
sudo rosdep init
rosdep update
