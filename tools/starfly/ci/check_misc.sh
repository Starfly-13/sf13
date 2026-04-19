#!/bin/bash
set -euo pipefail

MAPROOT="${MAPROOT:=_maps2eb}"

find . -name "*.php" -print0 | xargs -0 -n1 php -l
find . -name "*.json" -not -path "*/node_modules/*" -print0 | xargs -0 python3 ./tools/json_verifier.py
find ./${MAPROOT}/configs -name "*.json" -not -path "/data/*" -print0 | xargs -0 python3 ./tools/json_schema_validator.py ./${MAPROOT}/ship_config_schema.json
