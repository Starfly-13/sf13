#!/usr/bin/env bash
# check_file_dir.sh

set -euo pipefail

count=$(grep -o 'FILE_DIR' shiptest.dme | wc -l)
if [[ "$count" -ne 3 ]]; then
    echo "Error: shiptest.dme contains $count instances of FILE_DIR, expected exactly 3."
    echo "See: https://tgstation13.org/phpBB/viewtopic.php?f=5&t=321"
    exit 1
fi
echo "Success: shiptest.dme contains exactly 3 instances of FILE_DIR."
