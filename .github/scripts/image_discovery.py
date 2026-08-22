#!/usr/bin/env python3
# Automatic image discovery and build matrix generation script
# Copyright 2026 Samyar Sadat Akhavi
# Licensed under the MIT license

import tomllib
import json
import os
from pathlib import Path

# Script configuration
_CONF_FILE = Path(__file__).with_name("config.toml")
with _CONF_FILE.open("rb") as file:
    SCR_CONFIG = tomllib.load(file)

# DockerHub root repositories
ROOT_REPOS = {
    "base_images": os.environ["BASE_IMAGES_REPO"],
    "service_images": os.environ["SERVICE_IMAGES_REPO"]
}

gen_matrix = []
for root_name, repo in ROOT_REPOS.items():
    root_dir = Path(root_name)

    for dockerfile in sorted(root_dir.glob("*/*.Dockerfile")):
        image_dir = dockerfile.parent
        image_tag = f"{image_dir.name}-{dockerfile.stem}"
        platforms = SCR_CONFIG["build_platforms"]

        image_config_file = image_dir / "config.toml"
        if image_config_file.exists():
            with image_config_file.open("rb") as file:
                image_config = tomllib.load(file)

            platforms = image_config.get("build_platforms", platforms)

        gen_matrix.append({
            "dockerfile": str(dockerfile),
            "image": repo,
            "tag": image_tag,
            "platforms": ",".join(platforms)
        })
                
print(json.dumps(gen_matrix))