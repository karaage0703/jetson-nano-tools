#!/bin/bash -e

# Reference sites
# https://rb-station.com/article/jetson-nanoros2%E4%B8%8A%E3%81%A7%E3%81%AEintel-realsense%E3%81%AE%E5%8B%95%E4%BD%9C%E3%81%A8%E6%B3%A8%E6%84%8F%E7%82%B9
# https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/

echo "[Setup Sources]"
sudo apt update && sudo apt install -y curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

echo "[Update the package]"
sudo apt update

echo "[Installing ROS and ROS Packages]"
sudo apt install -y ros-dashing-desktop

echo "[Environment setup]"
source /opt/ros/dashing/setup.bash
sudo apt install -y python3-argcomplete
