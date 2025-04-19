# Docker Images - MicroROS GitHub Build Action Image (ROS 2 Humble)
# Copyright 2025 Samyar Sadat Akhavi
# Written by Samyar Sadat Akhavi, 2025.
# Licensed under the MIT License.

FROM ros:humble

# Metadata
LABEL org.opencontainers.image.source=https://github.com/samyarsadat/Docker-Images
LABEL org.opencontainers.image.authors="Samyar Sadat Akhavi <samyarsadat@gigawhat.net>"
LABEL org.opencontainers.image.description="SSA Docker Images: MicroROS Build Action (ROS 2 Humble)"

# Install dependencies
RUN apt-get update \
    && apt-get install -y git curl python3-pip \
    && apt-get install -y cmake gcc g++ \
    && rm -rf /var/lib/apt/lists/* && apt-get autoremove && apt-get autoclean