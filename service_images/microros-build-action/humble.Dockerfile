# Micro-ROS GitHub Build Action Image (ROS 2 Humble)
# Copyright 2025-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:humble

# Metadata
LABEL org.opencontainers.image.description="Micro-ROS Build Action (ROS 2 Humble)"

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git curl python3-pip cmake gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*