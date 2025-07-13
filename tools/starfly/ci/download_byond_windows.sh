#!/usr/bin/env bash
# download_byond_windows.sh

set -euo pipefail
source dependencies.sh
echo "Downloading BYOND version $BYOND_MAJOR.$BYOND_MINOR"
if [ ! -f C:/byond.zip ]; then
    curl "http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond.zip" -o C:/byond.zip -A "Starfly13/1.0 Continuous Integration"
fi
