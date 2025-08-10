#!/usr/bin/env bash
# check_dockerfile.sh

source dependencies.sh

count=$(grep -o "byond:${BYOND_MAJOR}.${BYOND_MINOR}" Dockerfile | wc -l)
if [[ "$count" == "0" ]]; then
    echo "Error: Dockerfile base version does not match dependencies.sh"
    exit 1
fi
echo "Success: Dockerfile base version matches dependencies.sh"
