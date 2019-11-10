#!/bin/bash
#Install ROS on nVidia Jetson Nano 
#ROS Melodic to Ubuntu

echo "Start Install\n"
if [ ! -e /etc/apt/sources.list.d/ros-latest.list ]; then
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
fi
echo "apt key recv-key\n"
sudo apt-get update
sudo apt-get install -y curl
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

##Not use apt-key
##curl -SsfL git.io/ros-gpg-key-update | sh

##sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

##sudo apt-key del 421C365BD9FF1F717815A3895523BAEEB01FA116
##sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C65

echo "apt update\n"
sudo apt update
apt search ros-melodic

echo "Install Ros Melodic FULL\n"
sudo apt install ros-melodic-desktop-full
sudo apt install ros-melodic-PACKAGE
sudo apt install ros-melodic-slam-gmapping
sudo rosdep init
rosdep update
sudo chmod 777 -R ~/.ros/

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install cmake python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools python-catkin-pkg python-empy python-nose python-setuptools libgtest-dev 

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
source /opt/ros/melodic/setup.bash
catkin init
catkin build
sh -c "echo \"source ~/catkin_ws/devel/setup.bash\" >> ~/.bashrc"
source ~/.bashrc

# enable all Ubuntu packages:
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-add-repository restricted

# pip should be installed
sudo apt-get install python-pip

# install Adafruit libraries
pip install Adafruit-MotorHAT
pip install Adafruit-SSD1306

#Grant your user access to the i2c bus:
sudo usermod -aG i2c $USER

# setting catkin_ws
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin init
catkin build
sudo sh -c 'echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc'

##Reboot
echo "Reboot\n"
sudo reboot