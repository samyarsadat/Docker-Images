# Excalidraw image for ARM64 (Latest)
# Copyright 2025-2026 Samyar Sadat Akhavi
# Licensed under the MIT license

# Step 1: Build the Excalidraw app
FROM node:24 AS build

WORKDIR /opt/node_app
RUN git clone https://github.com/excalidraw/excalidraw.git .

# Install dependencies and build the app
RUN yarn --frozen-lockfile --network-timeout 600000
ARG NODE_ENV=production
RUN yarn build:app:docker

# Step 2: Create the final image using nginx
FROM nginx:mainline-alpine

# Metadata
LABEL org.opencontainers.image.description="Excalidraw Image for ARM64 (Latest)"

# Copy built web app from build step
COPY --from=build /opt/node_app/excalidraw-app/build /usr/share/nginx/html
HEALTHCHECK CMD wget -q -O /dev/null http://localhost || exit 1