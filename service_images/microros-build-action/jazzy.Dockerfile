# Micro-ROS GitHub Build Action Image (ROS 2 Jazzy)
# Copyright 2025-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ros:jazzy@sha256:2589a8fba5257307857890173c069852c2abf913a0be7970f172478baecb09e4

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git curl python3-pip cmake gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*