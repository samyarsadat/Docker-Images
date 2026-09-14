# Main ServerPi Caddy V2 Image (Latest)
# Copyright 2024-2026 Samyar Sadat Akhavi
# Licensed under the MIT license.

FROM --platform=${BUILDPLATFORM} \
     caddy:builder@sha256:b8f9c720f13f64c13dd42db28e8f38a3fab54c11fce4d93bda26d710c448dcfd \
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
FROM caddy:latest@sha256:13ba145cba2f3e28fa801994876e4c086d1b95d5aa2a520a734765ffb6b12017

# Copy new Caddy binary from build step
COPY --from=builder /usr/bin/caddy /usr/bin/caddy