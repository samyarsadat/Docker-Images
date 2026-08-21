# Docker Images - Default Alpine Image (Latest)
# Copyright 2024 Samyar Sadat Akhavi
# Written by Samyar Sadat Akhavi, 2024.
# Licensed under the MIT License.

FROM alpine:latest


# Metadata
LABEL org.opencontainers.image.source=https://github.com/samyarsadat/Docker-Images
LABEL org.opencontainers.image.authors="Samyar Sadat Akhavi <samyarsadat@gigawhat.net>"
LABEL org.opencontainers.image.description="SSA Docker Images: Default Alpine Image (Latest)"

# Install bash, git, nano, and curl
USER root
RUN apk add --no-cache bash git nano curl

# Install and configure SUDO
RUN apk add --no-cache sudo \
    && echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

# Create non-root user
ARG USERNAME=nonroot
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV USERNAME=$USERNAME
ENV USER_HOME=/home/$USERNAME

RUN addgroup -g $USER_GID $USERNAME \
    && adduser -u $USER_UID -G $USERNAME $USERNAME --disabled-password \
    && echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && mkdir $USER_HOME/.config && chown -R $USER_UID:$USER_GID $USER_HOME

# Environment setup
USER $USERNAME