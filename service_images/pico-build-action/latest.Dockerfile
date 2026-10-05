# Raspberry Pi Pico C/C++ GitHub Build Action Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ubuntu:jammy@sha256:5ec03bb3441e8b0bf3b4f9cd4629a1ae763010dc3035bb8da3ae6cf026486401

# renovate: depName=pico-sdk packageName=https://github.com/raspberrypi/pico-sdk currentValue=master
ARG PICO_SDK_COMMIT=079c6f39023649b154152db30f1d781e884879bc

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git python3 rsync cmake gcc-arm-none-eabi libnewlib-arm-none-eabi \
       libstdc++-arm-none-eabi-newlib build-essential ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set Pico SDK path & compiler variables
ENV PICO_SDK_PATH=/pico/pico-sdk
ENV PICO_COMPILER=pico_arm_gcc

# "Install" the Pico SDK
RUN git init $PICO_SDK_PATH && cd $PICO_SDK_PATH \
    && git remote add origin https://github.com/raspberrypi/pico-sdk.git \
    && git fetch --depth 1 origin "$PICO_SDK_COMMIT" \
    && git checkout --detach FETCH_HEAD \
    && git submodule update --init --recursive --depth 1 \
    && rm -rf .git && find . -type f -name .git -delete