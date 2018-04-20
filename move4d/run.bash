#!/usr/bin/env bash

source /move4d/catkin_ws/devel/setup.bash
export HOME_MOVE4D=/move4d/data/move4d
roslaunch pointing_planner pointing_planner_dbg.launch
