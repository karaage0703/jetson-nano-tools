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

# Install TensorFlow
CHECK_VER=`cat /etc/nv_tegra_release | sed -n 1P`
R3210="# R32 (release), REVISION: 1.0, GCID: 14531094, BOARD: t210ref, EABI: aarch64, DATE: Wed Mar 13 07:46:13 UTC 2019"
R3231="# R32 (release), REVISION: 3.1, GCID: 18186506, BOARD: t210ref, EABI: aarch64, DATE: Tue Dec 10 06:58:34 UTC 2019"

if [ "${CHECK_VER}" = "${R3210}" ]; then
  echo $R3210
  sudo pip3 install -U cython
  pip3 install --no-cache-dir --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==1.13.1+nv19.4 --user
elif [ "${CHECK_VER}" = "${R3231}" ]; then
  echo $R3231
  pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v43 tensorflow-gpu --user
else
  echo "Not supported version, change JetPack version or setup tensorflow manually"
fi
