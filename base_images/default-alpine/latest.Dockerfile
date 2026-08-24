# Default Alpine Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

FROM alpine:latest

# Install required packages
RUN apk add --no-cache bash git nano curl sudo ca-certificates

# Create non-root user
ARG USERNAME=nonroot
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
ENV USERNAME=${USERNAME}

RUN addgroup -g "$USER_GID" "$USERNAME" \
    && adduser -u "$USER_UID" -G "$USERNAME" "$USERNAME" --disabled-password \
    && mkdir "/home/$USERNAME/.config" \
    && chown -R "$USER_UID:$USER_GID" "/home/$USERNAME"

# Configure SUDO
RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$USERNAME" \
    && chmod 0440 "/etc/sudoers.d/$USERNAME"

# Environment setup
WORKDIR /home/${USERNAME}
USER $USERNAME