# Docker Images - Caddy V2 Image With The CloudflareIPRange Module (Latest)
# This image is used by ServerPi.
# Copyright 2024 Samyar Sadat Akhavi
# Written by Samyar Sadat Akhavi, 2024.
# Licensed under the MIT License.

FROM caddy:builder AS builder

# Build Caddy with the CloudflareIPRange module
RUN xcaddy build \
    --with github.com/WeidiDeng/caddy-cloudflare-ip

# Standard Caddy image
FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Metadata
LABEL org.opencontainers.image.source=https://github.com/samyarsadat/Docker-Images
LABEL org.opencontainers.image.authors="Samyar Sadat Akhavi <samyarsadat@gigawhat.net>"
LABEL org.opencontainers.image.description="SSA Docker Images: ServerPi Caddy V2 Image (Latest)"