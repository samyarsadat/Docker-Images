# Docker Images - ROS 2 Jazzy Image w/ Vulcanexus (Base - No GUI apps)
# Copyright 2025 Samyar Sadat Akhavi
# Written by Samyar Sadat Akhavi, 2025.
# Licensed under the MIT License.

FROM eprosima/vulcanexus:jazzy-base


# Metadata
LABEL org.opencontainers.image.source=https://github.com/samyarsadat/Docker-Images
LABEL org.opencontainers.image.authors="Samyar Sadat Akhavi <samyarsadat@gigawhat.net>"
LABEL org.opencontainers.image.description="SSA Docker Images: ROS 2 Jazzy Image w/ Vulcanexus (Base - No GUI apps)"

# Install git, nano, and curl
RUN apt-get update \
    && apt-get install -y git nano curl \
    && rm -rf /var/lib/apt/lists/* && apt-get autoremove && apt-get autoclean

# I reject your default non-root user, and substitute my own!
RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu

# Create non-root user
ARG USERNAME=nonroot
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV USERNAME=$USERNAME
ENV USER_HOME=/home/$USERNAME

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir /home/$USERNAME/.config && chown -R $USER_UID:$USER_GID /home/$USERNAME/

# Install and configure SUDO
RUN apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && rm -rf /var/lib/apt/lists/* && apt-get autoremove && apt-get autoclean

# Environment setup
USER root