current_dir = $(shell pwd)
assimp_src=move4d/src/assimp/

all: build-img run-img selfcontained-img

build: build-img
	docker run -v ${current_dir}/move4d:/move4d move4d_ros:build

build-img: Dockerfile_build ${assimp_src}
	docker build -f Dockerfile_build . -t move4d_ros:build

${assimp_src}:
	(cd move4d/src; bash download_assimp.bash)
	
run:
	docker run --net=host -e ROS_MASTER_URI=${ROS_MASTER_URI} move4d_ros

run-it:
	docker run -it --net=host -e ROS_MASTER_URI=${ROS_MASTER_URI} move4d_ros bash

run-vol:
	docker run --net=host -e ROS_MASTER_URI=${ROS_MASTER_URI} -v ${current_dir}/move4d:/move4d move4d_ros:vol

run-img: build Dockerfile_run
	docker build -f Dockerfile_run . -t move4d_ros:vol

selfcontained-img: Dockerfile_selfcontained run-img
	docker build -f Dockerfile_selfcontained . -t move4d_ros:latest

