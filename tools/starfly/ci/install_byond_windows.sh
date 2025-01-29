#!/usr/bin/env bash
# install_byond_windows.sh

set -euo pipefail
source dependencies.sh
if [ ! -f C:/byond.zip ]; then
    curl "http://www.byond.com/download/build/$BYOND_MAJOR/$BYOND_MAJOR.${BYOND_MINOR}_byond.zip" -o C:/byond.zip
fi
unzip C:/byond.zip
