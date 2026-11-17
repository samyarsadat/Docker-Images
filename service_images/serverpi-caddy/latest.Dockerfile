# Main ServerPi Caddy V2 Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license.

FROM --platform=${BUILDPLATFORM} \
     caddy:builder@sha256:aef223d1f943bc12a29a9e0a0a73983aa19a36672daede7507da4201a6b1016a \
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
FROM caddy:latest@sha256:4851e54a46b206517c574821bb5cc67f170d2156041e9fbc4c9193b45e84a75b

# Copy new Caddy binary from build step
COPY --from=builder /usr/bin/caddy /usr/bin/caddy