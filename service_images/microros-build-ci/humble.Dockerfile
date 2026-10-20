# Micro-ROS CI Build Image (ROS 2 Humble)
# Copyright 2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:humble@sha256:566b87e6dfc48392189a9c32e594e84060fa9948de93b04e536f39475a1f6963

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git curl python3-pip cmake gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# renovate: depName=micro-ros-setup packageName=https://github.com/micro-ROS/micro_ros_setup currentValue=humble
ARG UROS_SETUP_COMMIT=99757720fdf33031a41288d8b69c7c0356f2db64

# Install micro-ROS setup
ARG UROS_SETUP_TMP=/micro-ros-setup/tmp
ARG UROS_SETUP_INSTALL=/micro-ros-setup/install
RUN mkdir -p "$UROS_SETUP_TMP" \
    && cd "$UROS_SETUP_TMP" \
    && git clone https://github.com/micro-ROS/micro_ros_setup src \
    && git -C src checkout --detach "$UROS_SETUP_COMMIT" \
    && . "/opt/ros/$ROS_DISTRO/setup.sh" \
    && apt-get update \
    && rosdep install --from-paths src --ignore-src -r -y \
    && colcon build --merge-install \
         --install-base "$UROS_SETUP_INSTALL" \
         --cmake-args -DBUILD_TESTING=OFF \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf "$UROS_SETUP_TMP"
