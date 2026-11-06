# Main ServerPi Caddy V2 Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license.

FROM --platform=${BUILDPLATFORM} \
     caddy:builder@sha256:ccd8bdb5d7b25c78962bac46b7daaabfb0a354d0decf7d752e1b69caf46d9b85 \
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
FROM caddy:latest@sha256:b060aafbec4f8f5404c80273c8d8758248f157920d0a0cdd5cb5656a527f6ec5

# Copy new Caddy binary from build step
COPY --from=builder /usr/bin/caddy /usr/bin/caddy