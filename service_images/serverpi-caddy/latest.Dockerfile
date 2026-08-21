# Main ServerPi Caddy V2 Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license.

FROM caddy:builder AS builder

# Build Caddy with the CloudflareIPRange module
RUN xcaddy build \
    --with github.com/WeidiDeng/caddy-cloudflare-ip

# Standard Caddy image
FROM caddy:latest

# Metadata
LABEL org.opencontainers.image.description="ServerPi Caddy V2 (Latest)"

# Copy new Caddy binary from build step
COPY --from=builder /usr/bin/caddy /usr/bin/caddy