#!/bin/bash

# install library
sudo apt-get update

sudo apt-get -y install swig

pip3 install tqdm
pip3 install slidingwindow
pip3 install tf_slim
pip3 install pycocotools

# setup tf-pose-estimation
cd && git clone https://github.com/ildoonet/tf-pose-estimation.git
cd ~/tf-pose-estimation
git remote add karaage0703 https://github.com/karaage0703/tf-pose-estimation
git fetch karaage0703
git checkout -b jpv45 karaage0703/jpv45
cd ~/tf-pose-estimation/tf_pose/pafprocess
swig -python -c++ pafprocess.i && python3 setup.py build_ext --inplace
cd ~/tf-pose-estimation/

# Reference site
# https://toramamma.blogspot.com/2019/04/jetson-nano-tensorflowopenpose.html
