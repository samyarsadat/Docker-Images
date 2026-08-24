# ROS 2 Jazzy Image (Full Desktop w/ Gazebo)
# Copyright 2025-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM osrf/ros:jazzy-desktop-full

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git nano curl sudo ros-${ROS_DISTRO}-ros-gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# I reject your default non-root user, and substitute my own!
RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu

# Create non-root user
ARG USERNAME=nonroot
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
ENV USERNAME=${USERNAME}

RUN groupadd --gid "$USER_GID" "$USERNAME" \
    && useradd -s /bin/bash --uid "$USER_UID" --gid "$USER_GID" -m "$USERNAME" \
    && mkdir "/home/$USERNAME/.config" \
    && chown -R "$USER_UID:$USER_GID" "/home/$USERNAME/"

# Configure SUDO
RUN echo "$USERNAME ALL=(root) NOPASSWD:ALL" > "/etc/sudoers.d/$USERNAME" \
    && chmod 0440 "/etc/sudoers.d/$USERNAME"

# Environment setup
WORKDIR /home/${USERNAME}
USER $USERNAME