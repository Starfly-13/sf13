#!/usr/bin/env bash
# check_maps_dir.sh

set -euo pipefail

count=$(fgrep -i -r "\"_maps" code | wc -l)
if [[ "$count" -ne 3 ]]; then
    echo "Error: Found $count instances of   '\"_maps'   expected exactly 3."
    exit 1
fi

count=$(fgrep -i -r " _maps" code | wc -l)
if [[ "$count" -ne 11 ]]; then
    echo "Error: Found $count instances of   ' _maps'   expected exactly 11."
    exit 1
fi

echo "Success: Hardcoded references to _maps are as expected."
