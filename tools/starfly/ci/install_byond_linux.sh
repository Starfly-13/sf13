#!/usr/bin/env bash
set -euo pipefail

# source all of the dependency defines
source dependencies.sh

# tell the user that we're installing BYOND
echo "Setting up BYOND ${BYOND_MAJOR}.${BYOND_MINOR}"
# this is the BYOND archive that we will install
BYOND_ZIP="${GITHUB_WORKSPACE}/cache/byond/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip"
# if the archive doesn't exist
if [ ! -f ${BYOND_ZIP} ]; then
    # tell the user BYOND is out of date
    echo "${BYOND_ZIP} not found; cannot setup BYOND"
    exit 1
fi
# remove any prior installation and set up a fresh directory
rm -rf "${HOME}/BYOND"
mkdir -p "${HOME}/BYOND"
# copy BYOND from our repo
cp -v "${BYOND_ZIP}" "${HOME}/BYOND/byond.zip"
# unzip and install BYOND
cd "${HOME}/BYOND"
unzip byond.zip
rm byond.zip
cd byond
make here
# record the version that we installed for posterity
echo "${BYOND_MAJOR}.${BYOND_MINOR}" > "${HOME}/BYOND/version.txt"
# change back to our home directory
cd "${HOME}"
