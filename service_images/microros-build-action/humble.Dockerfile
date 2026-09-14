# Micro-ROS GitHub Build Action Image (ROS 2 Humble)
# Copyright 2025-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:humble@sha256:1813d3c85d7f96ff7d3012d865204583255740182db5d0065f8f8cd029a83138

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git curl python3-pip cmake gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*