#  Docker Images - Caddy V2 Image With The CloudflareIPRange Module (Latest)
#  This image is used by ServerPi.
#  Copyright 2024 Samyar Sadat Akhavi
#  Written by Samyar Sadat Akhavi, 2024.
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https: www.gnu.org/licenses/>.

FROM caddy:builder AS builder

# Build Caddy with the CloudflareIPRange module
RUN xcaddy build \
    --with https://github.com/WeidiDeng/caddy-cloudflare-ip

# Standard Caddy image
FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy