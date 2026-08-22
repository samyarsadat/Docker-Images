#!/usr/bin/env python3
# Automatic image discovery and matrix generation script
# Copyright 2026 Samyar Sadat Akhavi
# Licensed under the MIT license

import argparse
import tomllib
import json
from pathlib import Path
from copy import deepcopy

# Command line arguments
parser = argparse.ArgumentParser()
parser.add_argument(
    "--analysis",
    action="store_true",
    help="generate image matrix for analysis workflow",
)
args = parser.parse_args()

# Script configuration
_CONF_FILE = Path(__file__).with_name("config.toml")
with _CONF_FILE.open("rb") as file:
    SCR_CONFIG = tomllib.load(file)


# TODO: it might be cleaner to create a config class later instead of
#       accessing values using a basic dictionary.
def load_img_config(image_dir: Path) -> dict:
    config_file = image_dir / "config.toml"
    ret_config = deepcopy(SCR_CONFIG["default_img_config"])

    if config_file.exists():
        with config_file.open("rb") as file:
            ret_config.update(tomllib.load(file)) 

    return ret_config


# Generate the image matrix based on config
gen_matrix = []
for root_name, repo in SCR_CONFIG["root_repos"].items():
    root_dir = Path(root_name)

    for image_dir in sorted(root_dir.glob("*/")):
        config = load_img_config(image_dir)

        analysis_ignore = config["analysis_ignore"]
        if args.analysis and analysis_ignore == "all":
            continue

        for dockerfile in sorted(image_dir.glob("*.Dockerfile")):
            if (args.analysis 
                and isinstance(analysis_ignore, list) 
                and dockerfile.stem in analysis_ignore
            ): continue

            gen_matrix.append({
                "dockerfile": str(dockerfile),
                "image": repo,
                "tag": f"{image_dir.name}-{dockerfile.stem}",
                "platforms": ",".join(config["build_platforms"]),
                "description": config["description_fmt"].format(
                    stem=dockerfile.stem
                )
            })
                
print(json.dumps(gen_matrix))