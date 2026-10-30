# Main ServerPi Caddy V2 Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license.

FROM --platform=${BUILDPLATFORM} \
     caddy:builder@sha256:a2535ba3f1878ec781a58cf2d6edfecc47633d22e2a92447fa8ca14b3a6bfaff \
     AS builder

# renovate: depName=caddy-cloudflare-ip packageName=https://github.com/WeidiDeng/caddy-cloudflare-ip currentValue=main
ARG CADDY_CF_IP_COMMIT=f53b62aa13cb7ad79c8b47aacc3f2f03989b67e5

# Build Caddy with the CloudflareIPRange module
ARG TARGETOS
ARG TARGETARCH
RUN CGO_ENABLED=0 GOOS="$TARGETOS" GOARCH="$TARGETARCH" \
    xcaddy build \
        --with "github.com/WeidiDeng/caddy-cloudflare-ip@$CADDY_CF_IP_COMMIT"

# Standard Caddy image
FROM caddy:latest@sha256:36c24ad91a7ff7bc4c87fe22bfa8df3c4b18da0773d73fc12ee2c52b98c0bb7e

# Copy new Caddy binary from build step
COPY --from=builder /usr/bin/caddy /usr/bin/caddy