# ROS 2 Jazzy Image (Base - No GUI)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:jazzy@sha256:c3706ef0a0aa45413c07803cf433602f543b22e45b4855f6fca955c2d8ecc4e8

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git nano curl sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# I reject your default non-root user, and substitute my own!
RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu

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