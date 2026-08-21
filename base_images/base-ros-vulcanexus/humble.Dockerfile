# ROS 2 Humble Vulcanexus Image (Base - No GUI)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM eprosima/vulcanexus:humble-base

# Metadata
LABEL org.opencontainers.image.description="ROS 2 Humble Vulcanexus (Base - No GUI)"

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git nano curl sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

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
RUN echo "$USERNAME ALL=\(root\) NOPASSWD:ALL" > "/etc/sudoers.d/$USERNAME" \
    && chmod 0440 "/etc/sudoers.d/$USERNAME"

# Environment setup
USER root