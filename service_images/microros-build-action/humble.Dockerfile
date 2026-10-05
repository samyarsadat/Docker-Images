# Micro-ROS GitHub Build Action Image (ROS 2 Humble)
# Copyright 2025-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:humble@sha256:860e53793ccf575e5369b5e9a19939de2bfcfb46a299954d06f54f2af54fed19

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git curl python3-pip cmake gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*