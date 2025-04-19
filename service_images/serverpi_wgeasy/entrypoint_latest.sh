#!/bin/bash
# Docker Images - WireGuard-Easy w/ WireGuard Exporter Image (Latest)
# This image is used by ServerPi.
# Copyright 2025 Samyar Sadat Akhavi
# Written by Samyar Sadat Akhavi, 2025.
# Licensed under the MIT License.

set -e
echo "-> entrypoint.sh"

# Start the WireGuard exporter service
echo "-> Starting WireGuard exporter..."
/bin/wireguard_exporter -wireguard.peer-file /etc/wireguard_exporter/peers.toml &

# Execute other commands
echo "-> Starting WG Easy..."
exec "$@"