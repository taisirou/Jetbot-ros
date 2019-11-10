# install dependencies
sudo apt-get install ros-melodic-vision-msgs ros-melodic-image-transport ros-melodic-image-publisher

# clone the repo
cd ~/catkin_ws/src
git clone https://github.com/dusty-nv/ros_deep_learning

# make ros_deep_learning
cd ../    # cd ~/catkin_ws
#catkin init
catkin build
