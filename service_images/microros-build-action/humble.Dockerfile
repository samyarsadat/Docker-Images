# Micro-ROS GitHub Build Action Image (ROS 2 Humble)
# Copyright 2025-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:humble@sha256:75dd3aba34a3838dadbb31a9f7bef769bdfa8713e6cec686fc868db2981b0987

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git curl python3-pip cmake gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*