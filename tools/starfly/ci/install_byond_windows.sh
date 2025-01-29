#!/usr/bin/env bash
# install_byond_windows.sh

set -euo pipefail
source dependencies.sh
BYOND_ZIP="${GITHUB_WORKSPACE}/cache/byond/${BYOND_MAJOR}.${BYOND_MINOR}_byond.zip"
if [ ! -f ${BYOND_ZIP} ]; then
    echo "${BYOND_ZIP} not found; cannot install BYOND"
    exit 1
fi
cp -v "${GITHUB_WORKSPACE}/cache/byond/${BYOND_MAJOR}.${BYOND_MINOR}_byond.zip" C:/byond.zip
unzip C:/byond.zip
rm C:/byond.zip
