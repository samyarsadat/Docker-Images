# Docker Images - Raspberry Pi Pico C/C++ GitHub Build Action Image (Latest)
# Copyright 2024 Samyar Sadat Akhavi
# Written by Samyar Sadat Akhavi, 2024.
# Licensed under the MIT License.

FROM ubuntu:jammy

# Metadata
LABEL org.opencontainers.image.source=https://github.com/samyarsadat/Docker-Images
LABEL org.opencontainers.image.authors="Samyar Sadat Akhavi <samyarsadat@gigawhat.net>"
LABEL org.opencontainers.image.description="SSA Docker Images: Pico Build Action (Latest)"

# Install dependencies
RUN apt-get update \
    && apt-get install -y cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib build-essential \
    && apt-get install -y git python3 rsync \
    && rm -rf /var/lib/apt/lists/* && apt-get autoremove && apt-get autoclean

# "Install" the Pico SDK
RUN mkdir /pico && cd /pico \
    && git clone https://github.com/raspberrypi/pico-sdk.git --branch master \
    && cd pico-sdk \
    && git submodule update --init

# Set Pico SDK path & compiler
ENV PICO_SDK_PATH=/pico/pico-sdk
ENV PICO_COMPILER=pico_arm_gcc