#!/usr/bin/env bash
# install_byond_linux.sh

set -euo pipefail
source dependencies.sh
BYOND_ZIP="${GITHUB_WORKSPACE}/cache/byond/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip"
if [ ! -f ${BYOND_ZIP} ]; then
    curl "http://www.byond.com/download/build/$BYOND_MAJOR/$BYOND_MAJOR.${BYOND_MINOR}_byond_linux.zip" -o ${BYOND_ZIP}
fi
rm -rf "${HOME}/BYOND"
mkdir -p "${HOME}/BYOND"
cp -v "${BYOND_ZIP}" "${HOME}/BYOND/byond.zip"
cd "${HOME}/BYOND"
unzip byond.zip
rm byond.zip
cd byond
make here
