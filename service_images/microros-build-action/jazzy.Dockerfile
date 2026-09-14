# Micro-ROS GitHub Build Action Image (ROS 2 Jazzy)
# Copyright 2025-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:jazzy@sha256:386d06ec6d4188f731bae5678e07b4cb64a4e4d4152090c0bd1f881dcf7706f5

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git curl python3-pip cmake gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*