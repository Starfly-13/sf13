#!/usr/bin/env bash
# download_byond_windows.sh

set -euo pipefail
source dependencies.sh
BYOND_ZIP="${GITHUB_WORKSPACE}/cache/byond/${BYOND_MAJOR}.${BYOND_MINOR}_byond.zip"
curl "http://www.byond.com/download/build/$BYOND_MAJOR/$BYOND_MAJOR.${BYOND_MINOR}_byond.zip" -o ${BYOND_ZIP}
