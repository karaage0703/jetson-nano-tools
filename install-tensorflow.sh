#!/bin/bash
# Reference Site
# https://docs.nvidia.com/deeplearning/dgx/install-tf-xavier/index.html

sudo apt-get update

# Install HDF5
sudo apt-get -y install libhdf5-serial-dev hdf5-tools

# Install pip
sudo apt-get -y install python3-pip

# Update
# pip3 install -U pip

# Install required packages
sudo apt-get -y install zlib1g-dev zip libjpeg8-dev libhdf5-dev
sudo pip3 install -U numpy==1.16.1 grpcio absl-py py-cpuinfo psutil portpicker grpcio six mock requests gast h5py astor termcolor
sudo pip3 install -U cython

# Install TensorFlow
pip3 install --no-cache-dir --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==1.13.1+nv19.4 --user

# Upgrade Numpy
sudo pip3 install numpy==1.18
#sudo pip3 install scipy==1.1.0
