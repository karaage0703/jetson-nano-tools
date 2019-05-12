#!/bin/bash
sudo apt-get update

# Install pip
sudo apt-get -y install python3-pip

# Install python packages
sudo apt-get -y install python3-pil
sudo apt-get -y install python3-matplotlib

# Install pip package
sudo pip3 install jupyter

# Install avahi daemon for .local access
sudo apt-get install avahi-daemon
