# move4d_ros_docker

clone with `--recursive` option to also get submodules

Build images with make:

    make

Run also with make:

    make run
    
It will start the pointing_planner node and connect to your current ros master (from the `ROS_MASTER_URI` env var),
connecting to your host network (this may be considered unsafe).
It runs with:

    docker run --net=host -e ROS_MASTER_URI=${ROS_MASTER_URI} -v ${current_dir}/move4d:/move4d move4d_ros
    

## Updating

    git pull
    git submodule update --init --remote # the--init is usefull only when new submodules are added (I guess)
    make

## The move4d_ros:build image

It is used to build the softwares, the sources must be binded through the `-v` option of `docker run`,
they stay on the volume: this is to avoid the creation of lots of intermediary images when you recompile the code.

It will compile the code when you run the image with `make build`.


## The move4d_ros:vol image

It is similar to move4d_ros:build image except that it runs the ros node when you run the image.

## The move4d_ros:latest image

It is selfcontained with all the executables, libraries and other files needed.
