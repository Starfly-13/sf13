#!/usr/bin/env bash
# lint.sh

set -euo pipefail

echo "# Checking Dockerfile"
tools/starfly/ci/check_dockerfile.sh

echo "# Checking shiptest.dme"

echo "## Checking FILE_DIR directives in shiptest.dme"
tools/starfly/ci/check_file_dir.sh

echo "## Checking include order in shiptest.dme"
python3 tools/starfly/python/check_dme_order.py shiptest.dme

echo "# Checking modular STARFLY13 flags for consistency"
python3 tools/starfly/python/check_modular_flags.py \
    code/__DEFINES/__starfly.dm \
    tgui/packages/tgui/starfly.ts
