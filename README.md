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

<br>

### Repository Structure
Service images are in `/service_images` and base images in `/base_images`.\
Each image in these directories may contain several Dockerfiles for each version of the image.\
For instance, `/base_images/default_ubuntu` may contain one Dockerfile named `Dockerfile_22-04` and another named `Dockerfile_24-04` for Ubuntu 22.04 and Ubuntu 24.04 versions respectively.

<br>

### Docker Hub
**Base Images**: _https://hub.docker.com/r/samyarsadat/custom_base_images_ \
**Service Images**: _https://hub.docker.com/r/samyarsadat/service_images_

<br>

### List of Docker Images
| Name                    | Description                                       | Tags                                                                                                  | Architectures                | Docker Hub Repository     |
| ----------------------- | ------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------------- |
| `default_alpine`        | Default Alpine Linux images                       | `default-alpine-latest`                                                                               | `linux/amd64`, `linux/arm64` | `custom_base_images`      |
| `default_ubuntu`        | Default Ubuntu images                             | `default-ubuntu-22.04`,<br> `default-ubuntu-24.04`                                                    | `linux/amd64`, `linux/arm64` | `custom_base_images`      |
| `base_ros`              | Default ROS Base images                           | `base-ros-humble`,<br> `base-ros-jazzy`                                                               | `linux/amd64`, `linux/arm64` | `custom_base_images`      |
| `base_ros_vulcanexus`   | Default ROS Base images w/ Vulcanexus             | `base-ros-vulcanexus-humble`,<br> `base-ros-vulcanexus-jazzy`                                         | `linux/amd64`, `linux/arm64` | `custom_base_images`      |
| `desktop_full_ros`      | Default ROS Full Desktop w/ Gazebo images         | `desktop-full-ros-humble`,<br> `desktop-full-ros-jazzy`                                               | `linux/amd64`                | `custom_base_images`      |
| `serverpi_caddy`        | The Caddy V2 image that is used by ServerPi       | `serverpi-caddy-latest`                                                                               | `linux/amd64`, `linux/arm64` | `service_images`          |
| `serverpi_wgeasy`       | The WireGuard-Easy image that is used by ServerPi | `serverpi-wgeasy-latest`                                                                              | `linux/amd64`, `linux/arm64` | `service_images`          |
| `pico_build_action`     | Raspberry Pi Pico GitHub build action image       | `pico-build-action-latest`                                                                            | `linux/amd64`, `linux/arm64` | `service_images`          |
| `microros_build_action` | MicroROS GitHub build action image                | `microros-build-action-latest`,<br> `microros-build-action-humble`,<br> `microros-build-action-jazzy` | `linux/amd64`, `linux/arm64` | `service_images`          |

<br>

### Status
[![Push base images to Docker Hub](https://github.com/samyarsadat/Docker-Images/actions/workflows/push_base_images.yml/badge.svg)](https://github.com/samyarsadat/Docker-Images/actions/workflows/push_base_images.yml)
<br>
[![Push service images to Docker Hub](https://github.com/samyarsadat/Docker-Images/actions/workflows/push_service_images.yml/badge.svg)](https://github.com/samyarsadat/Docker-Images/actions/workflows/push_service_images.yml)
<br>
[![Analyze all BASE images](https://github.com/samyarsadat/Docker-Images/actions/workflows/analyze_base_images.yml/badge.svg)](https://github.com/samyarsadat/Docker-Images/actions/workflows/analyze_base_images.yml)
<br>
[![Analyze all SERVICE images](https://github.com/samyarsadat/Docker-Images/actions/workflows/analyze_service_images.yml/badge.svg)](https://github.com/samyarsadat/Docker-Images/actions/workflows/analyze_service_images.yml)

<br>

## Contact
You can contact me via e-mail.\
E-mail: samyarsadat@gigawhat.net

If you think that you have found a bug or issue please report it <a href="../../issues">here</a>.

<br>

## Credits
| Role           | Name                                                             |
| -------------- | ---------------------------------------------------------------- |
| Maintainer     | <a href="https://github.com/samyarsadat">Samyar Sadat Akhavi</a> |

<br>
<br>

Copyright © 2024-2025 Samyar Sadat Akhavi.