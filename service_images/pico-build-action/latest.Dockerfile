# Raspberry Pi Pico C/C++ GitHub Build Action Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ubuntu:jammy

# Metadata
LABEL org.opencontainers.image.description="Pico Build Action (Latest)"

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git python3 rsync cmake gcc-arm-none-eabi libnewlib-arm-none-eabi \
       libstdc++-arm-none-eabi-newlib build-essential ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# "Install" the Pico SDK
RUN mkdir /pico && cd /pico \
    && git clone https://github.com/raspberrypi/pico-sdk.git --branch master \
    && cd pico-sdk \
    && git submodule update --init

# Set Pico SDK path & compiler
ENV PICO_SDK_PATH=/pico/pico-sdk
ENV PICO_COMPILER=pico_arm_gcc