# ROS 2 Humble Image (Full Desktop w/ Gazebo)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM osrf/ros:humble-desktop-full@sha256:b0302b39a2321079950b6a91a13eafe62e60bd42ffe61c3cea3d5e96886d0a87

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git nano curl sudo ros-$ROS_DISTRO-ros-gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
ARG USERNAME=nonroot
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV USERNAME=$USERNAME
ENV USER_HOME=/home/$USERNAME

RUN groupadd --gid "$USER_GID" "$USERNAME" \
    && useradd -s /bin/bash --uid "$USER_UID" --gid "$USER_GID" -m "$USERNAME" \
    && mkdir "$USER_HOME/.config" \
    && chown -R "$USER_UID:$USER_GID" "$USER_HOME"

# Configure SUDO
RUN echo "$USERNAME ALL=(root) NOPASSWD:ALL" > "/etc/sudoers.d/$USERNAME" \
    && chmod 0440 "/etc/sudoers.d/$USERNAME"

# Environment setup
WORKDIR $USER_HOME
USER $USERNAME