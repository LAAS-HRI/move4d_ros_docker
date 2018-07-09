#!/usr/bin/env bash

set -e



mkdir -p /move4d/src/assimp/build
cd /move4d/src/assimp/build
cmake .. -DCMAKE_INSTALL_PREFIX=/move4d
make -j8 install

mkdir -p /move4d/src/libmove3d/build
cd /move4d/src/libmove3d/build
cmake .. -DCMAKE_INSTALL_PREFIX=/move4d -DUSE_ROS_URDF=ON -DQT_LIBRARY=ON
make -j8 install

mkdir -p /move4d/src/move4d/build
cd /move4d/src/move4d/build
cmake .. -DCMAKE_INSTALL_PREFIX=/move4d
make -j8 install

mkdir -p /move4d/src/move4d_visibility_plugin/build
cd /move4d/src/move4d_visibility_plugin/build
cmake .. -DCMAKE_INSTALL_PREFIX=/move4d
make -j8 install

apt-get install -y ros-indigo-tf2 ros-indigo-tf

export LIB=$LD_LIBRARY_PATH
cd /move4d/catkin_ws
source /opt/ros/indigo/setup.bash
catkin_make -j8 -DCMAKE_LIBRARY_PATH=$LD_LIBRARY_PATH

