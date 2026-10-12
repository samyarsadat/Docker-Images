# Raspberry Pi Pico C/C++ CI Build Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM ubuntu:resolute@sha256:f144425ff09be612d6d9ad965196e9cdc23dae1f42110a8a11a3e9a8198759f7

# renovate: depName=pico-sdk packageName=https://github.com/raspberrypi/pico-sdk currentValue=master
ARG PICO_SDK_COMMIT=079c6f39023649b154152db30f1d781e884879bc
# renovate: depName=picotool packageName=https://github.com/raspberrypi/picotool currentValue=master
ARG PICOTOOL_COMMIT=2041936441b48a3cc53ae3da9e805229fe8f4e18

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git python3 rsync cmake gcc-arm-none-eabi libnewlib-arm-none-eabi \
       libstdc++-arm-none-eabi-newlib build-essential ca-certificates ninja-build \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set Pico SDK path & compiler variables
ENV PICO_SDK_PATH=/pico/pico-sdk
ENV PICO_COMPILER=pico_arm_gcc

# "Install" the Pico SDK
RUN git clone \
    --revision="$PICO_SDK_COMMIT" \
    --depth 1 --recurse-submodules --shallow-submodules \
    https://github.com/raspberrypi/pico-sdk.git "$PICO_SDK_PATH" \
    && rm -rf "$PICO_SDK_PATH/.git" \
    && find "$PICO_SDK_PATH" -type f -name .git -delete

# Install Picotool
ARG PICOTOOL_TMP=/pico/picotool
RUN git clone \
    --revision="$PICOTOOL_COMMIT" \
    --depth 1 --recurse-submodules --shallow-submodules \
    https://github.com/raspberrypi/picotool.git "$PICOTOOL_TMP" \
    && cmake -S "$PICOTOOL_TMP" -B "$PICOTOOL_TMP/build" -G Ninja \
    && cmake --build "$PICOTOOL_TMP/build" --parallel \
    && cmake --install "$PICOTOOL_TMP/build" \
    && rm -rf "$PICOTOOL_TMP"