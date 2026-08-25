# Raspberry Pi Pico C/C++ GitHub Build Action Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ubuntu:jammy@sha256:2edbbc5dc405e9612ba3584ce95480277e3eb374407b5505fe26f17df77c7dbc

# renovate: depName=pico-sdk packageName=https://github.com/raspberrypi/pico-sdk currentValue=master
ARG PICO_SDK_COMMIT=98a542c1a62fb549ffb5d66a3e5892b06276b670

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