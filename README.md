<h1 align="center">Docker Images</h1>

<p align="center">
	<br>
	<a href="https://www.docker.com/"><img src="https://github.com/samyarsadat/Docker-Images/raw/main/.github/images/docker-logo-blue.png"></a>
	<br><br>
	<a href="https://github.com/samyarsadat/Docker-Images/blob/main/LICENSE"><img src="https://img.shields.io/github/license/samyarsadat/Docker-Images?color=blue"></a>
	|
	<a href="https://github.com/samyarsadat/Docker-Images/issues"><img src="https://img.shields.io/github/issues/samyarsadat/Docker-Images"></a>
	<br><br>
</p>


----
This repository contains all of my custom base and service-specific Docker images.\
Base images are generic. They have a few standard packages installed but are otherwise non-specific.\
Service images are for a specific use case. They are not meant to be generic.

### CI Status

[![Build & Push Images](https://github.com/samyarsadat/Docker-Images/actions/workflows/build_images.yml/badge.svg)](https://github.com/samyarsadat/Docker-Images/actions/workflows/build_images.yml) \
[![Analyze Images](https://github.com/samyarsadat/Docker-Images/actions/workflows/analyze_images.yml/badge.svg)](https://github.com/samyarsadat/Docker-Images/actions/workflows/analyze_images.yml)

> [!NOTE]
> Both CI jobs auto-run every Monday, so images are updated weekly.

### Repository Structure

Service images are in `/service_images` and base images in `/base_images`.

Each image in these directories may contain several Dockerfiles for each version of the image. For instance, `/base_images/default-ubuntu` may contain one Dockerfile named `22.04.Dockerfile` and another named `24.04.Dockerfile` for Ubuntu 22.04 and Ubuntu 24.04 versions respectively.

Image tags are automatically derived from the Dockerfile filename and the parent directory name. From the example before, `22.04.Dockerfile` in `/base_images/default-ubuntu` will get the tag `default-ubuntu-22.04` and will be pushed to the `samyarsadat/custom_base_images` DockerHub repository.

### Docker Hub

**Base Images**: https://hub.docker.com/r/samyarsadat/custom_base_images \
**Service Images**: https://hub.docker.com/r/samyarsadat/service_images

### List of Docker Images

| Name                    | Description                                       | Tags                                                                           | Platforms                    | Docker Hub Repository     |
| ----------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------ | ---------------------------- | ------------------------- |
| `default-alpine`        | Default Alpine Linux images                       | `default-alpine-latest`                                                        | `linux/amd64`, `linux/arm64` | `custom_base_images`      |
| `default-ubuntu`        | Default Ubuntu images                             | `default-ubuntu-22.04`,<br> `default-ubuntu-24.04`,<br> `default-ubuntu-26.04` | `linux/amd64`, `linux/arm64` | `custom_base_images`      |
| `base-ros`              | Default ROS Base images                           | `base-ros-humble`,<br> `base-ros-jazzy`                                        | `linux/amd64`, `linux/arm64` | `custom_base_images`      |
| `base-ros-vulcanexus`   | Default ROS Base Vulcanexus images                | `base-ros-vulcanexus-humble`,<br> `base-ros-vulcanexus-jazzy`                  | `linux/amd64`, `linux/arm64` | `custom_base_images`      |
| `desktop-full-ros`      | Default ROS Full Desktop w/ Gazebo images         | `desktop-full-ros-humble`,<br> `desktop-full-ros-jazzy`                        | `linux/amd64`                | `custom_base_images`      |
| `serverpi-caddy`        | The Caddy V2 image that is used by ServerPi       | `serverpi-caddy-latest`                                                        | `linux/amd64`, `linux/arm64` | `service_images`          |
| `pico-build-action`     | Raspberry Pi Pico GitHub build action image       | `pico-build-action-latest`                                                     | `linux/amd64`, `linux/arm64` | `service_images`          |
| `microros-build-action` | MicroROS GitHub build action image                | `microros-build-action-humble`,<br> `microros-build-action-jazzy`              | `linux/amd64`, `linux/arm64` | `service_images`          |
| `excalidraw-arm64`      | Excalidraw image for ARM64                        | `excalidraw-arm64-latest`                                                      | `linux/arm64`                | `service_images`          |

<br>

## Contact

You can contact me via e-mail.\
E-mail: samyarsadat@gigawhat.net

If you think that you have found a bug or issue please report it [here](../../issues).

<br>

---
Copyright © 2024-2026 Samyar Sadat Akhavi.