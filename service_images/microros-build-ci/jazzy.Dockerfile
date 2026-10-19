# Micro-ROS CI Build Image (ROS 2 Jazzy)
# Copyright 2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:jazzy@sha256:103b6c417973394659af6804d4917cd489b91e5ed22eb7bef263025a3bed2410

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git curl python3-pip cmake gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# renovate: depName=micro-ros-setup packageName=https://github.com/micro-ROS/micro_ros_setup currentValue=jazzy
ARG UROS_SETUP_COMMIT=ed45678c6c0b567277b019f61c395add51c0783e

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
