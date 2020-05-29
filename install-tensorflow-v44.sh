#!/bin/bash
# Reference Site
# https://docs.nvidia.com/deeplearning/dgx/install-tf-xavier/index.html

sudo apt-get update

# Install HDF5
sudo apt-get -y install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran
# Install pip
sudo apt-get -y install python3-pip

# Install required packages
sudo apt-get -y install zlib1g-dev zip libjpeg8-dev libhdf5-dev
sudo pip3 install -U numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11

# Install TensorFlow
sudo pip3 install --no-cache-dir --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 tensorflow

# Upgrade Numpy
#sudo pip3 install numpy==1.18
#sudo pip3 install scipy==1.1.0
