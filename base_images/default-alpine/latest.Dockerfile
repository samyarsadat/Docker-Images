# Default Alpine Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM alpine:latest@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

# Install required packages
RUN apk add --no-cache bash git nano curl sudo ca-certificates

# Create non-root user
ARG USERNAME=nonroot
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV USERNAME=$USERNAME
ENV USER_HOME=/home/$USERNAME

RUN addgroup -g "$USER_GID" "$USERNAME" \
    && adduser -u "$USER_UID" -G "$USERNAME" "$USERNAME" --disabled-password \
    && mkdir "$USER_HOME/.config" \
    && chown -R "$USER_UID:$USER_GID" "$USER_HOME"

# Configure SUDO
RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$USERNAME" \
    && chmod 0440 "/etc/sudoers.d/$USERNAME"

# Environment setup
WORKDIR $USER_HOME
USER $USERNAME