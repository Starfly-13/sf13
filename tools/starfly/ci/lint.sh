#!/usr/bin/env bash
# lint.sh

set -euo pipefail

python3 tools/starfly/python/check_dme_order.py shiptest.dme
