# Micro-ROS GitHub Build Action Image (ROS 2 Jazzy)
# Copyright 2025-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:jazzy@sha256:c3706ef0a0aa45413c07803cf433602f543b22e45b4855f6fca955c2d8ecc4e8

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git curl python3-pip cmake gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*