#!/usr/bin/env bash
# install_byond_windows.sh

# Note: This script is expecting the BYOND_MAJOR.BYOND_MINOR version of BYOND
#       as defined in `dependencies.sh` to be downloaded to the path:
#
#       ${GITHUB_WORKSPACE}/cache/byond/${BYOND_MAJOR}.${BYOND_MINOR}_byond.zip
#
#       If the GitHub Workflow action to download and cache BYOND hasn't
#       already run, then this script is probably going to end with an error.

set -euo pipefail

# source all of the dependency defines
source dependencies.sh

# not really installing ... more like, staging
echo "Installing BYOND version $BYOND_MAJOR.$BYOND_MINOR"
cp -v "${GITHUB_WORKSPACE}/cache/byond/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" C:/byond.zip
