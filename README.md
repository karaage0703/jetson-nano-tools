# jetson-nano-tools
Jetson Nano useful tools (setup, examples)

# Dependency
< JetPack 4.2.2 

[Image link](https://qiita.com/karaage0703/items/0583528f1f9c34911a31)

# Usage
At first, clone this repository on jetson nano.

Please execute following command:

```sh
$ cd && git clone https://github.com/karaage0703/jetson-nano-tools
```

## Install TensorFlow
Execute following commands:

```sh
$ cd ~/jetson-nano-tools
$ ./install-tensorflow.sh
```

## Install pose estimation
Execute following commands after setup TensorFlow:

```sh
$ cd ~/jetson-nano-tools
$ ./install-pose-estimation.sh
```

## Install ROS melodic
Execute following commands:

```sh
$ cd ~/jetson-nano-tools
$ ./install-ros-melodic.sh
```

## Setup serial(ttyTHS*)
Execute following commands for using serial communication on application:

```sh
$ systemctl stop nvgetty
$ systemctl disable nvgetty
$ udevadm trigger
$ sudo apt-get install python3-serial
$ wget https://raw.githubusercontent.com/karaage0703/jetson-nano-tools/master/udev_rules/55-tegraserial.rules
$ sudo mv 55-tegraserial.rules /etc/udev/rules.d/
```

# License
This software is released under the MIT License, see LICENSE.

# Authors
karaage0703

# References
- https://www.jetsonhacks.com/2019/10/10/jetson-nano-uart/
- https://toramamma.blogspot.com/2019/04/jetson-nano-tensorflowopenpose.html
- https://docs.nvidia.com/deeplearning/dgx/install-tf-xavier/index.html
- https://devtalk.nvidia.com/default/topic/1063067/jetson-nano/read-amp-write-permission-ttyths1/
- https://www.stereolabs.com/blog/ros-and-nvidia-jetson-nano/
