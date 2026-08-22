#!/usr/bin/env python3
# Automatic image discovery and build matrix generation script
# Copyright 2026 Samyar Sadat Akhavi
# Licensed under the MIT license

import argparse
import tomllib
import json
from pathlib import Path


# Command line arguments
parser = argparse.ArgumentParser()
parser.add_argument(
    "--analysis",
    action="store_true",
    help="Generate image matrix for analysis workflow",
)
parser.add_argument(
    "--base-img-repo",
    type=str,
    help="Base images DockerHub repo",
)
parser.add_argument(
    "--svc-img-repo",
    type=str,
    help="Service images DockerHub repo",
)
args = parser.parse_args()

# Script configuration
_CONF_FILE = Path(__file__).with_name("config.toml")
with _CONF_FILE.open("rb") as file:
    SCR_CONFIG = tomllib.load(file)

# DockerHub root repositories
ROOT_REPOS = {
    "base_images": args.base_img_repo,
    "service_images": args.svc_img_repo
}


gen_matrix = []
for root_name, repo in ROOT_REPOS.items():
    root_dir = Path(root_name)

    for image_dir in sorted(root_dir.glob("*/")):
        platforms = SCR_CONFIG["build_platforms"]
        analysis_ignore = []

        image_config_file = image_dir / "config.toml"
        if image_config_file.exists():
            with image_config_file.open("rb") as file:
                image_config = tomllib.load(file)

            platforms = image_config.get("build_platforms", platforms)
            analysis_ignore = image_config.get("analysis_ignore", [])

            if args.analysis and analysis_ignore == "all":
                continue

        for dockerfile in sorted(image_dir.glob("*.Dockerfile")):
            if (args.analysis 
                and isinstance(analysis_ignore, list) 
                and dockerfile.stem in analysis_ignore
            ): continue

            image_tag = f"{image_dir.name}-{dockerfile.stem}"

            gen_matrix.append({
                "dockerfile": str(dockerfile),
                "image": repo,
                "tag": image_tag,
                "platforms": ",".join(platforms)
            })
                
print(json.dumps(gen_matrix))